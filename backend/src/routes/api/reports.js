const express = require('express');
const { v4: uuidv4 } = require('uuid');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');

const router = express.Router();

router.post('/', authRequired, (req, res) => {
  const { targetType, targetId, reason } = req.body || {};
  if (!targetType || !targetId || !reason) {
    return res.status(400).json({ error: '请填写举报信息', code: 400 });
  }
  const id = uuidv4();
  db.prepare(
    'INSERT INTO reports (id, reporter_id, target_type, target_id, reason) VALUES (?, ?, ?, ?, ?)',
  ).run(id, req.userId, String(targetType), String(targetId), String(reason).trim());

  db.prepare('INSERT INTO notifications (id, user_id, title, body, type) VALUES (?, ?, ?, ?, ?)').run(
    uuidv4(),
    req.userId,
    '举报已提交',
    '我们会尽快处理您的举报，感谢您的反馈。',
    'system',
  );
  res.status(201).json({ id });
});

module.exports = router;
