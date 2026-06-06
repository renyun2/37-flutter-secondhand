const { test, before, after } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('fs');
const path = require('path');

const dbPath = path.join(__dirname, '..', 'data', 'secondhand-test.db');

async function callApp(app, method, url, { token, body } = {}) {
  return new Promise((resolve, reject) => {
    const server = app.listen(0, () => {
      const { port } = server.address();
      const http = require('http');
      const payload = body ? JSON.stringify(body) : null;
      const req = http.request(
        {
          hostname: '127.0.0.1',
          port,
          path: url,
          method,
          headers: {
            'Content-Type': 'application/json',
            ...(token ? { Authorization: `Bearer ${token}` } : {}),
            ...(payload ? { 'Content-Length': Buffer.byteLength(payload) } : {}),
          },
        },
        (res) => {
          let raw = '';
          res.on('data', (c) => (raw += c));
          res.on('end', () => {
            server.close();
            resolve({
              status: res.statusCode,
              body: raw ? JSON.parse(raw) : null,
            });
          });
        },
      );
      req.on('error', (e) => {
        server.close();
        reject(e);
      });
      if (payload) req.write(payload);
      req.end();
    });
  });
}

before(() => {
  if (fs.existsSync(dbPath)) fs.unlinkSync(dbPath);
  process.env.SECONDHAND_DB_PATH = dbPath;
  delete require.cache[require.resolve('../src/db')];
  delete require.cache[require.resolve('../src/seed')];
  delete require.cache[require.resolve('../src/index')];
  const { seed } = require('../src/seed');
  seed(true);
});

after(() => {
  try {
    const db = require('../src/db');
    db.close();
  } catch (_) {}
  if (fs.existsSync(dbPath)) fs.unlinkSync(dbPath);
});

test('seed creates 100+ listings and 10 users with credit samples', () => {
  const db = require('../src/db');
  const listings = db.prepare('SELECT COUNT(*) AS c FROM listings').get().c;
  const users = db.prepare('SELECT COUNT(*) AS c FROM users').get().c;
  const credits = db.prepare('SELECT COUNT(*) AS c FROM credit_profiles').get().c;
  assert.ok(listings >= 100, `listings=${listings}`);
  assert.equal(users, 10);
  assert.equal(credits, 10);
});

test('credit gate blocks publish when score < 60', async () => {
  const app = require('../src/index');
  const login = await callApp(app, 'POST', '/api/auth/login', {
    body: { phone: '13800138005', code: '123456' },
  });
  assert.equal(login.status, 200);
  const token = login.body.token;
  assert.ok(login.body.user.creditScore < 60);

  const cat = await callApp(app, 'GET', '/api/listings/categories', { token });
  const categoryId = cat.body.categories[0].id;

  const create = await callApp(app, 'POST', '/api/listings', {
    token,
    body: { title: '测试商品', price: 99, categoryId },
  });
  assert.equal(create.status, 403);
  assert.match(create.body.error, /信用分不足/);
});

test('escrow release after buyer confirms receipt', async () => {
  const app = require('../src/index');
  const db = require('../src/db');

  const buyerLogin = await callApp(app, 'POST', '/api/auth/login', {
    body: { phone: '13800138001', code: '123456' },
  });
  const buyerToken = buyerLogin.body.token;
  const buyerId = buyerLogin.body.user.id;

  const listing = db
    .prepare("SELECT * FROM listings WHERE status = 'active' AND user_id != ? LIMIT 1")
    .get(buyerId);

  const sellerScoreBefore = db
    .prepare('SELECT score FROM credit_profiles WHERE user_id = ?')
    .get(listing.user_id).score;

  const orderRes = await callApp(app, 'POST', '/api/orders', {
    token: buyerToken,
    body: { listingId: listing.id, deliveryType: 'face' },
  });
  assert.equal(orderRes.status, 201);
  const orderId = orderRes.body.id;

  const pay = await callApp(app, 'POST', `/api/orders/${orderId}/pay`, { token: buyerToken });
  assert.equal(pay.status, 200);
  assert.equal(pay.body.status, 'paid');

  const confirm = await callApp(app, 'POST', `/api/orders/${orderId}/confirm`, { token: buyerToken });
  assert.equal(confirm.status, 200);
  assert.equal(confirm.body.status, 'released');

  const order = db.prepare('SELECT status, released_at FROM orders WHERE id = ?').get(orderId);
  assert.equal(order.status, 'released');
  assert.ok(order.released_at);

  const sellerScoreAfter = db
    .prepare('SELECT score FROM credit_profiles WHERE user_id = ?')
    .get(listing.user_id).score;
  assert.equal(sellerScoreAfter, sellerScoreBefore + 2);
});

test('dispute freezes order for 7 days and deducts seller credit', async () => {
  const app = require('../src/index');
  const db = require('../src/db');

  const buyerLogin = await callApp(app, 'POST', '/api/auth/login', {
    body: { phone: '13800138002', code: '123456' },
  });
  const buyerToken = buyerLogin.body.token;
  const buyerId = buyerLogin.body.user.id;

  const listing = db
    .prepare("SELECT * FROM listings WHERE status = 'active' AND user_id != ? LIMIT 1")
    .get(buyerId);

  const sellerScoreBefore = db
    .prepare('SELECT score FROM credit_profiles WHERE user_id = ?')
    .get(listing.user_id).score;

  const orderRes = await callApp(app, 'POST', '/api/orders', {
    token: buyerToken,
    body: { listingId: listing.id, deliveryType: 'face' },
  });
  const orderId = orderRes.body.id;
  await callApp(app, 'POST', `/api/orders/${orderId}/pay`, { token: buyerToken });

  const dispute = await callApp(app, 'POST', `/api/orders/${orderId}/dispute`, {
    token: buyerToken,
    body: { reason: '商品与描述不符' },
  });
  assert.equal(dispute.status, 200);
  assert.equal(dispute.body.status, 'disputed');
  assert.ok(dispute.body.disputeUntil);

  const order = db.prepare('SELECT status, dispute_until FROM orders WHERE id = ?').get(orderId);
  assert.equal(order.status, 'disputed');
  assert.ok(order.dispute_until);

  const until = new Date(order.dispute_until).getTime();
  const diffDays = (until - Date.now()) / (24 * 60 * 60 * 1000);
  assert.ok(diffDays >= 6.9 && diffDays <= 7.1);

  const sellerScoreAfter = db
    .prepare('SELECT score FROM credit_profiles WHERE user_id = ?')
    .get(listing.user_id).score;
  assert.equal(sellerScoreAfter, sellerScoreBefore - 10);

  const confirm = await callApp(app, 'POST', `/api/orders/${orderId}/confirm`, { token: buyerToken });
  assert.equal(confirm.status, 400);
});
