const express = require('express');
const stockController = require('../controllers/StockController');

const router = express.Router();

router.get('/stocks', stockController.getStocks);

module.exports = router;