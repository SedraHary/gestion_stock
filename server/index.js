const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const usersRoutes = require('./routes/UsersRoutes');
const articleRoutes = require('./routes/ArticleRoutes');
const billDetailRoutes = require('./routes/BillDetailRoutes');
const billRoutes = require('./routes/BillRoutes');
const customerRoutes = require('./routes/CustomerRoutes');
const stockRoutes = require('./routes/StockRoutes');
const storeRoutes = require('./routes/StoreRoutes');
const supplierRoutes = require('./routes/SupplierRoutes');
const path = require('path');

const app = express();
// app.use(express.static('../public'));
app.use(cors());

// app.get('/dashboard', (req, res) => {
//   // Servez le fichier dashboard.html
//   res.sendFile(path.join(__dirname, 'public', 'dashboard.html'));
// });
app.use(express.static(path.join(__dirname, '../public')));

// Route pour "/dashboard"
app.get('/dashboard', (req, res) => {
  // Servez le fichier dashboard.html
  res.sendFile(path.join(__dirname, '../public', 'dashboard.html'));
});
// app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.json());

app.use('/api', usersRoutes);
app.use('/api', articleRoutes);
app.use('/api', billDetailRoutes);
app.use('/api', billRoutes);
app.use('/api', customerRoutes);
app.use('/api', stockRoutes);
app.use('/api', storeRoutes);
app.use('/api', supplierRoutes);

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
