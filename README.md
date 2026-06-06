# 二手闲置交易 App（Flutter）

C2C 二手交易平台：发布闲置、同城筛选、议价聊天 Mock、担保交易、信用分、举报、面交/邮寄、求购广场。

## 技术栈

| 层 | 技术 |
|---|---|
| 前端 | Flutter 3.22+、Riverpod + freezed、go_router、dio、cached_network_image |
| 后端 Mock | Express + SQLite，端口 `3024` |

Web 兼容：不使用 camera / image_picker / geolocator；商品图使用 URL；聊天为 HTTP 3 秒轮询；同城为手动选区域。

## 目录结构

```
37-flutter-secondhand/
├── backend/          # Express Mock API
├── mobile/           # Flutter 应用
├── prompt.md         # 需求说明
└── README.md
```

## 前置条件

- Node.js 18+
- Flutter 3.22+（已启用 Web）

## 启动

### 1. 后端

```bash
cd backend
npm install
npm run dev
```

服务地址：`http://localhost:3024`

### 2. 前端（Chrome Web）

```bash
cd mobile
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome --web-port=5194 --dart-define=API_BASE=http://localhost:3024
```

### 演示登录

- 手机号：任意（如 `13800138000`）
- 验证码：`123456`

种子数据含 10 个用户（含不同信用分样例）、105 条商品、15 条求购帖。

## 测试

### 后端

```bash
cd backend
npm test
```

覆盖：托管放款、信用门禁（<60 不可发布）、纠纷 7 天冻结。

### 前端

```bash
cd mobile
flutter test
```

## 页面与路由（22 页）

| 页面 | 路由 |
|------|------|
| 启动 | `/splash` |
| 登录 | `/login` |
| 首页 | `/home` |
| 分类 | `/categories` |
| 商品列表 | `/listings` |
| 商品详情 | `/listing/:id` |
| 发布 | `/listing/create` |
| 编辑 | `/listing/:id/edit` |
| 议价聊天 | `/chat/:listingId` |
| 下单 | `/order/create` |
| 支付托管 | `/order/:id/pay` |
| 买入订单 | `/orders/buy` |
| 卖出订单 | `/orders/sell` |
| 订单详情 | `/order/:id` |
| 申请纠纷 | `/order/:id/dispute` |
| 求购广场 | `/wanted` |
| 发求购 | `/wanted/create` |
| 信用中心 | `/credit` |
| 收藏 | `/favorites` |
| 我的发布 | `/my-listings` |
| 个人中心 | `/profile` |
| 设置 | `/settings` |

底部导航：首页 | 发布 | 消息 | 我的

## 核心业务

- **担保交易**：`paid → shipped → received → released`（面交可跳过发货）
- **聊天**：3 秒 HTTP 轮询
- **信用**：成交 +2、纠纷 -10；信用 < 60 限制发布
- **纠纷**：资金冻结 7 天 Mock
