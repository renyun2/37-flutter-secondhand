const express = require('express');
const { v4: uuidv4 } = require('uuid');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');
const { canPublish } = require('../../utils/credit');

const router = express.Router();

function mapListing(row, extras = {}) {
  return {
    id: row.id,
    userId: row.user_id,
    title: row.title,
    description: row.description || '',
    price: row.price,
    categoryId: row.category_id,
    categoryName: row.category_name || '',
    region: row.region,
    imageUrl: row.image_url,
    status: row.status,
    sellerName: row.seller_name || row.nickname || '',
    createdAt: row.created_at,
    ...extras,
  };
}

router.get('/', authRequired, (req, res) => {
  const { categoryId, region, minPrice, maxPrice, q, mine } = req.query;
  const conditions = ["l.status = 'active'"];
  const params = [];

  if (mine === '1') {
    conditions.push('l.user_id = ?');
    params.push(req.userId);
  }
  if (categoryId) {
    conditions.push('l.category_id = ?');
    params.push(categoryId);
  }
  if (region) {
    conditions.push('l.region = ?');
    params.push(region);
  }
  if (minPrice) {
    conditions.push('l.price >= ?');
    params.push(Number(minPrice));
  }
  if (maxPrice) {
    conditions.push('l.price <= ?');
    params.push(Number(maxPrice));
  }
  if (q) {
    conditions.push('(l.title LIKE ? OR l.description LIKE ?)');
    const kw = `%${String(q).trim()}%`;
    params.push(kw, kw);
  }

  const sql = `
    SELECT l.*, u.nickname AS seller_name, c.name AS category_name
    FROM listings l
    JOIN users u ON u.id = l.user_id
    JOIN categories c ON c.id = l.category_id
    WHERE ${conditions.join(' AND ')}
    ORDER BY l.created_at DESC
    LIMIT 100
  `;
  const rows = db.prepare(sql).all(...params);
  const favs = new Set(
    db.prepare('SELECT listing_id FROM favorites WHERE user_id = ?').all(req.userId).map((r) => r.listing_id),
  );
  res.json({ listings: rows.map((r) => mapListing(r, { favorited: favs.has(r.id) })) });
});

router.get('/categories', authRequired, (_req, res) => {
  const rows = db.prepare('SELECT * FROM categories ORDER BY sort_order').all();
  res.json({ categories: rows.map((r) => ({ id: r.id, name: r.name })) });
});

router.get('/:id', authRequired, (req, res) => {
  const row = db
    .prepare(
      `SELECT l.*, u.nickname AS seller_name, c.name AS category_name
       FROM listings l
       JOIN users u ON u.id = l.user_id
       JOIN categories c ON c.id = l.category_id
       WHERE l.id = ?`,
    )
    .get(req.params.id);
  if (!row) return res.status(404).json({ error: '商品不存在' });
  const favorited = !!db
    .prepare('SELECT 1 FROM favorites WHERE user_id = ? AND listing_id = ?')
    .get(req.userId, row.id);
  res.json({ listing: mapListing(row, { favorited, isOwner: row.user_id === req.userId }) });
});

router.post('/', authRequired, (req, res) => {
  if (!canPublish(req.userId)) {
    return res.status(403).json({
      error: '信用分不足 60，暂时无法发布商品',
      code: 403,
      creditScore: req.user.creditScore,
    });
  }
  const { title, description, price, categoryId, region, imageUrl } = req.body || {};
  if (!title || price == null || !categoryId) {
    return res.status(400).json({ error: '请填写标题、价格和分类', code: 400 });
  }
  const cat = db.prepare('SELECT id FROM categories WHERE id = ?').get(categoryId);
  if (!cat) return res.status(400).json({ error: '分类不存在', code: 400 });

  const id = uuidv4();
  const img = imageUrl || `https://picsum.photos/seed/sh${id.slice(0, 8)}/400/400`;
  db.prepare(
    `INSERT INTO listings (id, user_id, title, description, price, category_id, region, image_url)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
  ).run(
    id,
    req.userId,
    String(title).trim(),
    String(description || '').trim(),
    Number(price),
    categoryId,
    String(region || req.user.region).trim(),
    img,
  );
  res.status(201).json({ id });
});

router.patch('/:id', authRequired, (req, res) => {
  const listing = db.prepare('SELECT * FROM listings WHERE id = ?').get(req.params.id);
  if (!listing) return res.status(404).json({ error: '商品不存在' });
  if (listing.user_id !== req.userId) return res.status(403).json({ error: '无权操作', code: 403 });

  const { title, description, price, status, region, imageUrl } = req.body || {};
  if (status === 'inactive') {
    db.prepare('UPDATE listings SET status = ? WHERE id = ?').run('inactive', listing.id);
    return res.json({ ok: true });
  }

  db.prepare(
    `UPDATE listings SET title = ?, description = ?, price = ?, region = ?, image_url = ?
     WHERE id = ?`,
  ).run(
    title != null ? String(title).trim() : listing.title,
    description != null ? String(description).trim() : listing.description,
    price != null ? Number(price) : listing.price,
    region != null ? String(region).trim() : listing.region,
    imageUrl != null ? String(imageUrl) : listing.image_url,
    listing.id,
  );
  res.json({ ok: true });
});

module.exports = router;
