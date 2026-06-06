const { v4: uuidv4 } = require('uuid');
const db = require('../db');

const CREDIT_MIN_PUBLISH = 60;
const CREDIT_TRADE_BONUS = 2;
const CREDIT_DISPUTE_PENALTY = 10;

function getScore(userId) {
  const row = db.prepare('SELECT score FROM credit_profiles WHERE user_id = ?').get(userId);
  return row?.score ?? 80;
}

function adjustCredit(userId, delta, reason) {
  const current = getScore(userId);
  const next = Math.max(0, Math.min(100, current + delta));
  db.prepare('UPDATE credit_profiles SET score = ?, updated_at = datetime(\'now\') WHERE user_id = ?').run(
    next,
    userId,
  );
  db.prepare('INSERT INTO credit_logs (id, user_id, delta, reason) VALUES (?, ?, ?, ?)').run(
    uuidv4(),
    userId,
    delta,
    reason,
  );
  return next;
}

function canPublish(userId) {
  return getScore(userId) >= CREDIT_MIN_PUBLISH;
}

module.exports = {
  CREDIT_MIN_PUBLISH,
  CREDIT_TRADE_BONUS,
  CREDIT_DISPUTE_PENALTY,
  getScore,
  adjustCredit,
  canPublish,
};
