const { v4: uuidv4 } = require('uuid');
const db = require('./db');

const REGIONS = ['北京', '上海', '广州', '深圳', '杭州', '成都', '武汉', '西安'];
const CATEGORIES = ['数码', '家具', '服饰', '书籍', '美妆', '母婴', '运动', '其他'];

const TITLES = {
  数码: ['二手 iPhone', 'MacBook Air', 'iPad 平板', '蓝牙耳机', '机械键盘', '显示器', 'Switch 游戏机', '相机镜头'],
  家具: ['宜家书桌', '布艺沙发', '实木衣柜', '人体工学椅', '床头柜', '落地灯', '书架', '餐桌'],
  服饰: ['羽绒服', '运动鞋', '牛仔裤', '连衣裙', '羊毛大衣', '帆布鞋', '卫衣', '皮带'],
  书籍: ['考研资料', '小说套装', '编程书籍', '儿童绘本', '教材全套', '漫画合集', '词典', '杂志'],
  美妆: ['口红套装', '护肤礼盒', '香水', '化妆刷', '面膜', '粉底液', '眼影盘', '美容仪'],
  母婴: ['婴儿推车', '儿童自行车', '绘本玩具', '婴儿床', '安全座椅', '奶粉罐', '学步车', '儿童座椅'],
  运动: ['跑步机', '哑铃套装', '瑜伽垫', '羽毛球拍', '篮球', '滑板', '登山包', '泳衣'],
  其他: ['电饭煲', '微波炉', '台灯', '收纳箱', '绿植盆栽', '工具箱', '吉他', '露营帐篷'],
};

const CREDIT_SAMPLES = [95, 88, 82, 75, 68, 55, 48, 72, 90, 62];

function seed(force = false) {
  const count = db.prepare('SELECT COUNT(*) AS c FROM users').get().c;
  if (count > 0 && !force) {
    console.log('Seed skipped: data already exists');
    return;
  }

  if (force) {
    const tables = [
      'reports', 'notifications', 'favorites', 'order_status_logs', 'orders',
      'chat_messages', 'wanted_posts', 'listings', 'addresses', 'credit_logs',
      'credit_profiles', 'sessions', 'categories', 'users',
    ];
    for (const t of tables) {
      try {
        db.prepare(`DELETE FROM ${t}`).run();
      } catch (_) {}
    }
  }

  const categoryIds = {};
  CATEGORIES.forEach((name, i) => {
    const id = uuidv4();
    categoryIds[name] = id;
    db.prepare('INSERT INTO categories (id, name, sort_order) VALUES (?, ?, ?)').run(id, name, i);
  });

  const userIds = [];
  for (let i = 0; i < 10; i++) {
    const id = uuidv4();
    const phone = `1380013800${i}`;
    const nickname = ['闲置达人', '淘货小王', '诚信卖家', '低价出清', '搬家甩卖', '信用较低', '新手卖家', '数码控', '家具党', '书虫'][i];
    const region = REGIONS[i % REGIONS.length];
    db.prepare('INSERT INTO users (id, phone, nickname, region) VALUES (?, ?, ?, ?)').run(id, phone, nickname, region);
    db.prepare('INSERT INTO credit_profiles (user_id, score) VALUES (?, ?)').run(id, CREDIT_SAMPLES[i]);
    db.prepare('INSERT INTO credit_logs (id, user_id, delta, reason) VALUES (?, ?, ?, ?)').run(
      uuidv4(),
      id,
      0,
      '初始信用分',
    );
    userIds.push(id);

    db.prepare(
      `INSERT INTO addresses (id, user_id, name, phone, province, city, district, detail, is_default)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)`,
    ).run(uuidv4(), id, nickname, phone, region, region, '城区', '演示路 1 号');
  }

  const demoUserId = userIds[0];
  db.prepare('INSERT INTO sessions (token, user_id) VALUES (?, ?)').run('demo-token-37', demoUserId);

  let listingCount = 0;
  for (let i = 0; i < 105; i++) {
    const cat = CATEGORIES[i % CATEGORIES.length];
    const titles = TITLES[cat];
    const title = `${titles[i % titles.length]} #${i + 1}`;
    const sellerId = userIds[i % userIds.length];
    const region = REGIONS[i % REGIONS.length];
    const id = uuidv4();
    const price = Math.round((20 + (i % 50) * 15 + Math.random() * 50) * 100) / 100;
    db.prepare(
      `INSERT INTO listings (id, user_id, title, description, price, category_id, region, image_url, status)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'active')`,
    ).run(
      id,
      sellerId,
      title,
      `九成新，${region}同城可面交，支持担保交易。`,
      price,
      categoryIds[cat],
      region,
      `https://picsum.photos/seed/sh37${i}/400/400`,
    );
    listingCount++;
  }

  for (let i = 0; i < 15; i++) {
    const id = uuidv4();
    db.prepare(
      `INSERT INTO wanted_posts (id, user_id, title, description, budget, region, category_id)
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
    ).run(
      id,
      userIds[i % userIds.length],
      `求购 ${CATEGORIES[i % CATEGORIES.length]} 好物`,
      '诚心求购，价格可议',
      100 + i * 50,
      REGIONS[i % REGIONS.length],
      categoryIds[CATEGORIES[i % CATEGORIES.length]],
    );
  }

  const sampleListing = db.prepare('SELECT id FROM listings LIMIT 1').get();
  db.prepare('INSERT INTO chat_messages (id, listing_id, user_id, content) VALUES (?, ?, ?, ?)').run(
    uuidv4(),
    sampleListing.id,
    userIds[1],
    '你好，还能便宜点吗？',
  );

  db.prepare('INSERT INTO notifications (id, user_id, title, body, type) VALUES (?, ?, ?, ?, ?)').run(
    uuidv4(),
    demoUserId,
    '欢迎使用二手闲置',
    '担保交易保障买卖双方权益，信用分越高曝光越多。',
    'system',
  );

  console.log(`Seed complete: ${userIds.length} users, ${listingCount} listings, ${CATEGORIES.length} categories`);
}

if (require.main === module) {
  seed(true);
}

module.exports = { seed };
