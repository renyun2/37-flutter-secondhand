const express = require('express');
const { v4: uuidv4 } = require('uuid');
const db = require('../../db');
const { authRequired } = require('../../middleware/auth');
const { adjustCredit, CREDIT_TRADE_BONUS, CREDIT_DISPUTE_PENALTY } = require('../../utils/credit');

const router = express.Router();

const DISPUTE_FREEZE_DAYS = 7;

function logStatus(orderId, status, message) {
  db.prepare('INSERT INTO order_status_logs (id, order_id, status, message) VALUES (?, ?, ?, ?)').run(
    uuidv4(),
    orderId,
    status,
    message,
  );
}

function mapOrder(row) {
  return {
    id: row.id,
    listingId: row.listing_id,
    listingTitle: row.listing_title || '',
    listingImage: row.image_url || '',
    buyerId: row.buyer_id,
    sellerId: row.seller_id,
    buyerName: row.buyer_name || '',
    sellerName: row.seller_name || '',
    amount: row.amount,
    status: row.status,
    deliveryType: row.delivery_type,
    address: row.address_json ? JSON.parse(row.address_json) : null,
    trackingNo: row.tracking_no,
    disputeUntil: row.dispute_until,
    createdAt: row.created_at,
    paidAt: row.paid_at,
    shippedAt: row.shipped_at,
    receivedAt: row.received_at,
    releasedAt: row.released_at,
  };
}

router.get('/', authRequired, (req, res) => {
  const { role } = req.query;
  let rows;
  if (role === 'sell') {
    rows = db
      .prepare(
        `SELECT o.*, l.title AS listing_title, l.image_url, ub.nickname AS buyer_name, us.nickname AS seller_name
         FROM orders o
         JOIN listings l ON l.id = o.listing_id
         JOIN users ub ON ub.id = o.buyer_id
         JOIN users us ON us.id = o.seller_id
         WHERE o.seller_id = ?
         ORDER BY o.created_at DESC`,
      )
      .all(req.userId);
  } else {
    rows = db
      .prepare(
        `SELECT o.*, l.title AS listing_title, l.image_url, ub.nickname AS buyer_name, us.nickname AS seller_name
         FROM orders o
         JOIN listings l ON l.id = o.listing_id
         JOIN users ub ON ub.id = o.buyer_id
         JOIN users us ON us.id = o.seller_id
         WHERE o.buyer_id = ?
         ORDER BY o.created_at DESC`,
      )
      .all(req.userId);
  }
  res.json({ orders: rows.map(mapOrder) });
});

router.get('/:id', authRequired, (req, res) => {
  const row = db
    .prepare(
      `SELECT o.*, l.title AS listing_title, l.image_url, ub.nickname AS buyer_name, us.nickname AS seller_name
       FROM orders o
       JOIN listings l ON l.id = o.listing_id
       JOIN users ub ON ub.id = o.buyer_id
       JOIN users us ON us.id = o.seller_id
       WHERE o.id = ?`,
    )
    .get(req.params.id);
  if (!row) return res.status(404).json({ error: '订单不存在' });
  if (row.buyer_id !== req.userId && row.seller_id !== req.userId) {
    return res.status(403).json({ error: '无权查看', code: 403 });
  }
  const logs = db
    .prepare('SELECT status, message, created_at AS createdAt FROM order_status_logs WHERE order_id = ? ORDER BY created_at')
    .all(row.id);
  res.json({ order: mapOrder(row), logs });
});

router.post('/', authRequired, (req, res) => {
  const { listingId, deliveryType, addressId } = req.body || {};
  if (!listingId) return res.status(400).json({ error: '缺少商品', code: 400 });

  const listing = db.prepare('SELECT * FROM listings WHERE id = ? AND status = ?').get(listingId, 'active');
  if (!listing) return res.status(404).json({ error: '商品不存在或已下架' });
  if (listing.user_id === req.userId) return res.status(400).json({ error: '不能购买自己的商品' });

  const type = deliveryType === 'mail' ? 'mail' : 'face';
  let addressJson = null;
  if (type === 'mail') {
    if (!addressId) return res.status(400).json({ error: '邮寄订单需选择地址', code: 400 });
    const addr = db.prepare('SELECT * FROM addresses WHERE id = ? AND user_id = ?').get(addressId, req.userId);
    if (!addr) return res.status(400).json({ error: '地址不存在', code: 400 });
    addressJson = JSON.stringify({
      id: addr.id,
      name: addr.name,
      phone: addr.phone,
      province: addr.province,
      city: addr.city,
      district: addr.district,
      detail: addr.detail,
    });
  }

  const id = uuidv4();
  db.prepare(
    `INSERT INTO orders (id, listing_id, buyer_id, seller_id, amount, delivery_type, address_json)
     VALUES (?, ?, ?, ?, ?, ?, ?)`,
  ).run(id, listing.id, req.userId, listing.user_id, listing.price, type, addressJson);
  logStatus(id, 'pending_payment', '订单已创建，待支付托管');
  res.status(201).json({ id });
});

router.post('/:id/pay', authRequired, (req, res) => {
  const order = db.prepare('SELECT * FROM orders WHERE id = ?').get(req.params.id);
  if (!order) return res.status(404).json({ error: '订单不存在' });
  if (order.buyer_id !== req.userId) return res.status(403).json({ error: '仅买家可支付', code: 403 });
  if (order.status !== 'pending_payment') return res.status(400).json({ error: '订单状态不允许支付' });

  db.prepare("UPDATE orders SET status = 'paid', paid_at = datetime('now') WHERE id = ?").run(order.id);
  logStatus(order.id, 'paid', 'Mock 托管支付成功，资金已冻结');
  res.json({ ok: true, status: 'paid' });
});

router.post('/:id/ship', authRequired, (req, res) => {
  const order = db.prepare('SELECT * FROM orders WHERE id = ?').get(req.params.id);
  if (!order) return res.status(404).json({ error: '订单不存在' });
  if (order.seller_id !== req.userId) return res.status(403).json({ error: '仅卖家可发货', code: 403 });
  if (order.status !== 'paid') return res.status(400).json({ error: '订单状态不允许发货' });
  if (order.delivery_type !== 'mail') return res.status(400).json({ error: '面交订单无需发货' });

  const { trackingNo } = req.body || {};
  db.prepare(
    "UPDATE orders SET status = 'shipped', shipped_at = datetime('now'), tracking_no = ? WHERE id = ?",
  ).run(trackingNo || 'SF' + Date.now(), order.id);
  logStatus(order.id, 'shipped', '卖家已发货');
  res.json({ ok: true, status: 'shipped' });
});

router.post('/:id/confirm', authRequired, (req, res) => {
  const order = db.prepare('SELECT * FROM orders WHERE id = ?').get(req.params.id);
  if (!order) return res.status(404).json({ error: '订单不存在' });
  if (order.buyer_id !== req.userId) return res.status(403).json({ error: '仅买家可确认收货', code: 403 });
  if (order.status === 'disputed') return res.status(400).json({ error: '订单纠纷处理中，暂不可确认' });

  const allowed =
    (order.delivery_type === 'face' && order.status === 'paid') ||
    (order.delivery_type === 'mail' && order.status === 'shipped');
  if (!allowed) return res.status(400).json({ error: '当前状态不可确认收货' });

  const release = db.transaction(() => {
    db.prepare(
      "UPDATE orders SET status = 'released', received_at = datetime('now'), released_at = datetime('now') WHERE id = ?",
    ).run(order.id);
    logStatus(order.id, 'received', '买家确认收货');
    logStatus(order.id, 'released', '托管资金已放款给卖家');
    adjustCredit(order.buyer_id, CREDIT_TRADE_BONUS, '交易完成 +2');
    adjustCredit(order.seller_id, CREDIT_TRADE_BONUS, '交易完成 +2');
    db.prepare("UPDATE listings SET status = 'sold' WHERE id = ?").run(order.listing_id);
  });
  release();
  res.json({ ok: true, status: 'released' });
});

router.post('/:id/dispute', authRequired, (req, res) => {
  const order = db.prepare('SELECT * FROM orders WHERE id = ?').get(req.params.id);
  if (!order) return res.status(404).json({ error: '订单不存在' });
  if (order.buyer_id !== req.userId) return res.status(403).json({ error: '仅买家可申请纠纷', code: 403 });
  if (!['paid', 'shipped'].includes(order.status)) {
    return res.status(400).json({ error: '当前状态不可申请纠纷' });
  }

  const { reason } = req.body || {};
  const disputeUntil = new Date(Date.now() + DISPUTE_FREEZE_DAYS * 24 * 60 * 60 * 1000).toISOString();

  db.prepare(
    "UPDATE orders SET status = 'disputed', dispute_until = ? WHERE id = ?",
  ).run(disputeUntil, order.id);
  logStatus(order.id, 'disputed', `纠纷已提交：${reason || '未说明'}，资金冻结 ${DISPUTE_FREEZE_DAYS} 天`);
  adjustCredit(order.seller_id, -CREDIT_DISPUTE_PENALTY, '交易纠纷 -10');

  db.prepare('INSERT INTO notifications (id, user_id, title, body, type) VALUES (?, ?, ?, ?, ?)').run(
    uuidv4(),
    order.seller_id,
    '订单纠纷通知',
    `买家对订单 ${order.id.slice(0, 8)} 发起纠纷，资金冻结至 ${disputeUntil.slice(0, 10)}`,
    'order',
  );

  res.json({ ok: true, status: 'disputed', disputeUntil });
});

module.exports = router;
