const express = require('express');
const { v4: uuidv4 } = require('uuid');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');

const router = express.Router();

function mapWanted(row) {
  return {
    id: row.id,
    userId: row.user_id,
    title: row.title,
    description: row.description || '',
    budget: row.budget,
    region: row.region,
    categoryId: row.category_id,
    categoryName: row.category_name || '',
    authorName: row.nickname || '',
    status: row.status,
    createdAt: row.created_at,
  };
}

router.get('/', authRequired, (req, res) => {
  const { region } = req.query;
  let rows;
  if (region) {
    rows = db
      .prepare(
        `SELECT w.*, u.nickname, c.name AS category_name
         FROM wanted_posts w
         JOIN users u ON u.id = w.user_id
         LEFT JOIN categories c ON c.id = w.category_id
         WHERE w.status = 'open' AND w.region = ?
         ORDER BY w.created_at DESC`,
      )
      .all(region);
  } else {
    rows = db
      .prepare(
        `SELECT w.*, u.nickname, c.name AS category_name
         FROM wanted_posts w
         JOIN users u ON u.id = w.user_id
         LEFT JOIN categories c ON c.id = w.category_id
         WHERE w.status = 'open'
         ORDER BY w.created_at DESC`,
      )
      .all();
  }
  res.json({ wanted: rows.map(mapWanted) });
});

router.post('/', authRequired, (req, res) => {
  const { title, description, budget, region, categoryId } = req.body || {};
  if (!title) return res.status(400).json({ error: '请填写求购标题', code: 400 });
  const id = uuidv4();
  db.prepare(
    `INSERT INTO wanted_posts (id, user_id, title, description, budget, region, category_id)
     VALUES (?, ?, ?, ?, ?, ?, ?)`,
  ).run(
    id,
    req.userId,
    String(title).trim(),
    String(description || '').trim(),
    budget != null ? Number(budget) : null,
    String(region || req.user.region).trim(),
    categoryId || null,
  );
  res.status(201).json({ id });
});

module.exports = router;
