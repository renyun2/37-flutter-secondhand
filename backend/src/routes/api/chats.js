const express = require('express');
const { v4: uuidv4 } = require('uuid');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');

const router = express.Router({ mergeParams: true });

router.get('/:listingId/messages', authRequired, (req, res) => {
  const listing = db.prepare('SELECT id FROM listings WHERE id = ?').get(req.params.listingId);
  if (!listing) return res.status(404).json({ error: '商品不存在' });

  const rows = db
    .prepare(
      `SELECT m.*, u.nickname
       FROM chat_messages m
       JOIN users u ON u.id = m.user_id
       WHERE m.listing_id = ?
       ORDER BY m.created_at ASC`,
    )
    .all(req.params.listingId);

  res.json({
    messages: rows.map((r) => ({
      id: r.id,
      listingId: r.listing_id,
      userId: r.user_id,
      authorName: r.nickname,
      content: r.content,
      isMine: r.user_id === req.userId,
      createdAt: r.created_at,
    })),
  });
});

router.post('/:listingId/messages', authRequired, (req, res) => {
  const listing = db.prepare('SELECT id FROM listings WHERE id = ?').get(req.params.listingId);
  if (!listing) return res.status(404).json({ error: '商品不存在' });
  const { content } = req.body || {};
  if (!content || !String(content).trim()) {
    return res.status(400).json({ error: '消息不能为空', code: 400 });
  }
  const id = uuidv4();
  db.prepare('INSERT INTO chat_messages (id, listing_id, user_id, content) VALUES (?, ?, ?, ?)').run(
    id,
    req.params.listingId,
    req.userId,
    String(content).trim(),
  );
  res.status(201).json({ id });
});

module.exports = router;
