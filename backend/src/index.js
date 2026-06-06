const express = require('express');
const cors = require('cors');
const { seed } = require('./seed');

const authRoutes = require('./routes/api/auth');
const listingsRoutes = require('./routes/api/listings');
const wantedRoutes = require('./routes/api/wanted');
const chatsRoutes = require('./routes/api/chats');
const ordersRoutes = require('./routes/api/orders');
const creditRoutes = require('./routes/api/credit');
const reportsRoutes = require('./routes/api/reports');
const favoritesRoutes = require('./routes/api/favorites');
const addressesRoutes = require('./routes/api/addresses');
const notificationsRoutes = require('./routes/api/notifications');

seed();

const app = express();
const PORT = process.env.PORT || 3024;

app.use(cors({ origin: true }));
app.use(express.json());

app.get('/health', (_req, res) => res.json({ ok: true, service: 'secondhand' }));

app.use('/api/auth', authRoutes);
app.use('/api/listings', listingsRoutes);
app.use('/api/wanted', wantedRoutes);
app.use('/api/chats', chatsRoutes);
app.use('/api/orders', ordersRoutes);
app.use('/api/credit', creditRoutes);
app.use('/api/reports', reportsRoutes);
app.use('/api/favorites', favoritesRoutes);
app.use('/api/addresses', addressesRoutes);
app.use('/api/notifications', notificationsRoutes);

if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Secondhand backend running at http://localhost:${PORT}`);
    console.log(`API base: http://localhost:${PORT}/api`);
  });
}

module.exports = app;
