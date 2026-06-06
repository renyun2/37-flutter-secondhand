const express = require('express');
const { v4: uuidv4 } = require('uuid');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');
const { getScore } = require('../../utils/credit');

const router = express.Router();

function createUser(phone, nickname, region = '北京') {
  const id = uuidv4();
  db.prepare('INSERT INTO users (id, phone, nickname, region) VALUES (?, ?, ?, ?)').run(
    id,
    phone,
    nickname,
    region,
  );
  db.prepare('INSERT INTO credit_profiles (user_id, score) VALUES (?, ?)').run(id, 80);
  return db.prepare('SELECT id, phone, nickname, region FROM users WHERE id = ?').get(id);
}

router.post('/login', (req, res) => {
  const { phone, code, region } = req.body || {};
  if (!phone) return res.status(400).json({ error: '请输入手机号', code: 400 });
  if (!code || String(code) !== '123456') {
    return res.status(400).json({ error: '验证码错误（演示验证码 123456）', code: 400 });
  }
  const p = String(phone).trim();
  let user = db.prepare('SELECT id, phone, nickname, region FROM users WHERE phone = ?').get(p);
  if (!user) {
    user = createUser(p, `用户${p.slice(-4)}`, region || '北京');
  }
  const token = uuidv4();
  db.prepare('INSERT INTO sessions (token, user_id) VALUES (?, ?)').run(token, user.id);
  res.json({
    token,
    user: { ...user, creditScore: getScore(user.id) },
  });
});

router.post('/logout', authRequired, (req, res) => {
  db.prepare('DELETE FROM sessions WHERE token = ?').run(req.token);
  res.json({ ok: true });
});

router.get('/me', authRequired, (req, res) => {
  res.json({ user: req.user });
});

router.patch('/region', authRequired, (req, res) => {
  const { region } = req.body || {};
  if (!region) return res.status(400).json({ error: '请选择区域', code: 400 });
  db.prepare('UPDATE users SET region = ? WHERE id = ?').run(String(region).trim(), req.userId);
  res.json({ ok: true, region: String(region).trim() });
});

module.exports = router;
