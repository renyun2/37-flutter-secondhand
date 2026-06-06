const express = require('express');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');

const router = express.Router();

router.get('/', authRequired, (req, res) => {
  const rows = db
    .prepare('SELECT * FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 50')
    .all(req.userId);
  res.json({
    notifications: rows.map((r) => ({
      id: r.id,
      title: r.title,
      body: r.body,
      type: r.type,
      read: !!r.read_flag,
      createdAt: r.created_at,
    })),
    unreadCount: rows.filter((r) => !r.read_flag).length,
  });
});

router.post('/read-all', authRequired, (req, res) => {
  db.prepare('UPDATE notifications SET read_flag = 1 WHERE user_id = ?').run(req.userId);
  res.json({ ok: true });
});

module.exports = router;
