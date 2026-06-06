const express = require('express');
const { v4: uuidv4 } = require('uuid');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');

const router = express.Router();

function mapAddress(row) {
  return {
    id: row.id,
    name: row.name,
    phone: row.phone,
    province: row.province,
    city: row.city,
    district: row.district,
    detail: row.detail,
    isDefault: !!row.is_default,
  };
}

router.get('/', authRequired, (req, res) => {
  const rows = db
    .prepare('SELECT * FROM addresses WHERE user_id = ? ORDER BY is_default DESC, rowid DESC')
    .all(req.userId);
  res.json({ addresses: rows.map(mapAddress) });
});

router.post('/', authRequired, (req, res) => {
  const { name, phone, province, city, district, detail, isDefault } = req.body || {};
  if (!name || !phone || !province || !city || !district || !detail) {
    return res.status(400).json({ error: '请填写完整地址', code: 400 });
  }
  const id = uuidv4();
  if (isDefault) {
    db.prepare('UPDATE addresses SET is_default = 0 WHERE user_id = ?').run(req.userId);
  }
  db.prepare(
    `INSERT INTO addresses (id, user_id, name, phone, province, city, district, detail, is_default)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
  ).run(id, req.userId, name, phone, province, city, district, detail, isDefault ? 1 : 0);
  const row = db.prepare('SELECT * FROM addresses WHERE id = ?').get(id);
  res.status(201).json({ address: mapAddress(row) });
});

router.patch('/:id', authRequired, (req, res) => {
  const existing = db.prepare('SELECT * FROM addresses WHERE id = ? AND user_id = ?').get(req.params.id, req.userId);
  if (!existing) return res.status(404).json({ error: '地址不存在' });
  const { name, phone, province, city, district, detail, isDefault } = req.body || {};
  if (isDefault) {
    db.prepare('UPDATE addresses SET is_default = 0 WHERE user_id = ?').run(req.userId);
  }
  db.prepare(
    `UPDATE addresses SET name = ?, phone = ?, province = ?, city = ?, district = ?, detail = ?, is_default = ?
     WHERE id = ?`,
  ).run(
    name ?? existing.name,
    phone ?? existing.phone,
    province ?? existing.province,
    city ?? existing.city,
    district ?? existing.district,
    detail ?? existing.detail,
    isDefault != null ? (isDefault ? 1 : 0) : existing.is_default,
    existing.id,
  );
  res.json({ ok: true });
});

router.delete('/:id', authRequired, (req, res) => {
  const result = db.prepare('DELETE FROM addresses WHERE id = ? AND user_id = ?').run(req.params.id, req.userId);
  if (result.changes === 0) return res.status(404).json({ error: '地址不存在' });
  res.json({ ok: true });
});

module.exports = router;
