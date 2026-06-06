const express = require('express');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');
const { CREDIT_MIN_PUBLISH } = require('../../utils/credit');

const router = express.Router();

router.get('/', authRequired, (req, res) => {
  const profile = db.prepare('SELECT score, updated_at AS updatedAt FROM credit_profiles WHERE user_id = ?').get(req.userId);
  const logs = db
    .prepare('SELECT delta, reason, created_at AS createdAt FROM credit_logs WHERE user_id = ? ORDER BY created_at DESC LIMIT 50')
    .all(req.userId);
  res.json({
    score: profile?.score ?? 80,
    minPublish: CREDIT_MIN_PUBLISH,
    canPublish: (profile?.score ?? 80) >= CREDIT_MIN_PUBLISH,
    logs,
  });
});

module.exports = router;
