const express = require('express');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');

const router = express.Router();

router.get('/', authRequired, (req, res) => {
  const rows = db
    .prepare(
      `SELECT l.*, u.nickname AS seller_name, c.name AS category_name
       FROM favorites f
       JOIN listings l ON l.id = f.listing_id
       JOIN users u ON u.id = l.user_id
       JOIN categories c ON c.id = l.category_id
       WHERE f.user_id = ?
       ORDER BY f.created_at DESC`,
    )
    .all(req.userId);
  res.json({
    listings: rows.map((r) => ({
      id: r.id,
      title: r.title,
      price: r.price,
      imageUrl: r.image_url,
      region: r.region,
      categoryName: r.category_name,
      sellerName: r.seller_name,
      status: r.status,
    })),
  });
});

router.post('/', authRequired, (req, res) => {
  const { listingId } = req.body || {};
  if (!listingId) return res.status(400).json({ error: '缺少商品 ID', code: 400 });
  const listing = db.prepare('SELECT id FROM listings WHERE id = ?').get(listingId);
  if (!listing) return res.status(404).json({ error: '商品不存在' });
  try {
    db.prepare('INSERT INTO favorites (user_id, listing_id) VALUES (?, ?)').run(req.userId, listingId);
  } catch {
    return res.status(400).json({ error: '已收藏' });
  }
  res.json({ ok: true });
});

router.delete('/:listingId', authRequired, (req, res) => {
  db.prepare('DELETE FROM favorites WHERE user_id = ? AND listing_id = ?').run(req.userId, req.params.listingId);
  res.json({ ok: true });
});

module.exports = router;
