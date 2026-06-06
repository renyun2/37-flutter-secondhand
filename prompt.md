# 项目 37：二手闲置交易 App（Flutter）

> 本文件仅描述需求，不包含任何实现代码。UI 使用 Material 基础组件，不做美化。

## 一、项目简介
C2C 二手交易平台：发布闲置、同城筛选、议价聊天 Mock、担保交易、信用分、举报、面交/邮寄、求购广场。Express Mock 实现订单托管与信用体系。

## 二、技术栈

### 前端
- Flutter 3.22+、Riverpod + freezed、go_router、dio
- cached_network_image

### 后端 Mock
- Express + SQLite，端口 `3024`

### Web 兼容约束
- **禁止**：camera、image_picker、geolocator、即时通讯 SDK
- **替代**：商品图 URL；聊天=HTTP 轮询；同城=选手动区域

## 三、后端 Mock API 设计

| 模块 | 路径 | 说明 |
|------|------|------|
| 认证 | `/api/auth/*` | |
| 商品 | GET `/api/listings` | 分类、价格、区域 |
| 商品 | POST `/api/listings` | 发布 |
| 商品 | PATCH `/api/listings/:id` | 下架 |
| 求购 | GET/POST `/api/wanted` | 求购帖 |
| 议价 | GET/POST `/api/chats/:listingId/messages` | |
| 订单 | POST `/api/orders` | 担保下单 |
| 订单 | POST `/api/orders/:id/pay` | Mock 托管 |
| 订单 | POST `/api/orders/:id/confirm` | 买家确认收货 |
| 订单 | POST `/api/orders/:id/dispute` | 纠纷 |
| 信用 | GET `/api/credit` | 分数、记录 |
| 举报 | POST `/api/reports` | |
| 收藏 | `/api/favorites` | |
| 地址 | CRUD `/api/addresses` | 邮寄 |
| 消息 | `/api/notifications` | |

**业务规则**：确认收货后放款给卖家；纠纷冻结 7 天 Mock；信用<60 限制发布。

## 四、页面清单（≥22 页）

| 序号 | 页面 | 路由 | 说明 |
|------|------|------|------|
| 1 | 启动 | `/splash` | |
| 2 | 登录 | `/login` | |
| 3 | 首页 | `/home` | 推荐流 |
| 4 | 分类 | `/categories` | |
| 5 | 商品列表 | `/listings` | |
| 6 | 商品详情 | `/listing/:id` | |
| 7 | 发布 | `/listing/create` | |
| 8 | 编辑 | `/listing/:id/edit` | |
| 9 | 议价聊天 | `/chat/:listingId` | |
| 10 | 下单 | `/order/create` | 面交/邮寄 |
| 11 | 支付托管 | `/order/:id/pay` | |
| 12 | 买入订单 | `/orders/buy` | |
| 13 | 卖出订单 | `/orders/sell` | |
| 14 | 订单详情 | `/order/:id` | |
| 15 | 申请纠纷 | `/order/:id/dispute` | |
| 16 | 求购广场 | `/wanted` | |
| 17 | 发求购 | `/wanted/create` | |
| 18 | 信用中心 | `/credit` | |
| 19 | 收藏 | `/favorites` | |
| 20 | 我的发布 | `/my-listings` | |
| 21 | 个人中心 | `/profile` | |
| 22 | 设置 | `/settings` | |

**底部导航**：首页 | 发布 | 消息 | 我的

## 五、核心功能需求
1. 担保交易：paid→shipped→received→released 状态轴
2. 聊天轮询：3s 间隔
3. 信用：成交+2、纠纷-10
4. 面交订单：无物流字段

## 六、编译与调试
```bash
cd backend && npm run dev    # :3024
flutter run -d chrome --web-port=5194 --dart-define=API_BASE=http://localhost:3024
```

## 七、交付物
- seed：≥100  listing、10 用户信用样例
- 测试：托管放款、信用门禁、纠纷冻结
- README

## 八、本次任务
**只列出需求和架构规划，不要写代码。**
