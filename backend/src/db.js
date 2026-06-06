const Database = require('better-sqlite3');
const fs = require('fs');
const path = require('path');

const dataDir = path.join(__dirname, '..', 'data');
if (!fs.existsSync(dataDir)) fs.mkdirSync(dataDir, { recursive: true });

const dbPath = process.env.SECONDHAND_DB_PATH || path.join(dataDir, 'secondhand.db');
const db = new Database(dbPath);
db.pragma('journal_mode = WAL');
db.pragma('foreign_keys = ON');

function initSchema() {
  db.exec(`
    CREATE TABLE IF NOT EXISTS users (
      id TEXT PRIMARY KEY,
      phone TEXT NOT NULL UNIQUE,
      nickname TEXT NOT NULL,
      password TEXT NOT NULL DEFAULT '123456',
      region TEXT NOT NULL DEFAULT '北京',
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS sessions (
      token TEXT PRIMARY KEY,
      user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS credit_profiles (
      user_id TEXT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
      score INTEGER NOT NULL DEFAULT 80,
      updated_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS credit_logs (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
      delta INTEGER NOT NULL,
      reason TEXT NOT NULL,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS categories (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL UNIQUE,
      sort_order INTEGER NOT NULL DEFAULT 0
    );

    CREATE TABLE IF NOT EXISTS listings (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL REFERENCES users(id),
      title TEXT NOT NULL,
      description TEXT DEFAULT '',
      price REAL NOT NULL,
      category_id TEXT NOT NULL REFERENCES categories(id),
      region TEXT NOT NULL,
      image_url TEXT NOT NULL,
      status TEXT NOT NULL DEFAULT 'active',
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS wanted_posts (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL REFERENCES users(id),
      title TEXT NOT NULL,
      description TEXT DEFAULT '',
      budget REAL,
      region TEXT NOT NULL,
      category_id TEXT REFERENCES categories(id),
      status TEXT NOT NULL DEFAULT 'open',
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS chat_messages (
      id TEXT PRIMARY KEY,
      listing_id TEXT NOT NULL REFERENCES listings(id) ON DELETE CASCADE,
      user_id TEXT NOT NULL REFERENCES users(id),
      content TEXT NOT NULL,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS orders (
      id TEXT PRIMARY KEY,
      listing_id TEXT NOT NULL REFERENCES listings(id),
      buyer_id TEXT NOT NULL REFERENCES users(id),
      seller_id TEXT NOT NULL REFERENCES users(id),
      amount REAL NOT NULL,
      status TEXT NOT NULL DEFAULT 'pending_payment',
      delivery_type TEXT NOT NULL DEFAULT 'face',
      address_json TEXT,
      tracking_no TEXT,
      dispute_until TEXT,
      created_at TEXT NOT NULL DEFAULT (datetime('now')),
      paid_at TEXT,
      shipped_at TEXT,
      received_at TEXT,
      released_at TEXT
    );

    CREATE TABLE IF NOT EXISTS order_status_logs (
      id TEXT PRIMARY KEY,
      order_id TEXT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
      status TEXT NOT NULL,
      message TEXT NOT NULL,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS favorites (
      user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
      listing_id TEXT NOT NULL REFERENCES listings(id) ON DELETE CASCADE,
      created_at TEXT NOT NULL DEFAULT (datetime('now')),
      PRIMARY KEY (user_id, listing_id)
    );

    CREATE TABLE IF NOT EXISTS addresses (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
      name TEXT NOT NULL,
      phone TEXT NOT NULL,
      province TEXT NOT NULL,
      city TEXT NOT NULL,
      district TEXT NOT NULL,
      detail TEXT NOT NULL,
      is_default INTEGER NOT NULL DEFAULT 0
    );

    CREATE TABLE IF NOT EXISTS notifications (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
      title TEXT NOT NULL,
      body TEXT NOT NULL,
      type TEXT NOT NULL DEFAULT 'system',
      read_flag INTEGER NOT NULL DEFAULT 0,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS reports (
      id TEXT PRIMARY KEY,
      reporter_id TEXT NOT NULL REFERENCES users(id),
      target_type TEXT NOT NULL,
      target_id TEXT NOT NULL,
      reason TEXT NOT NULL,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );
  `);
}

initSchema();

module.exports = db;
