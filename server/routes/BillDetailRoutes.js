const express = require('express');
const billDetailController = require('../controllers/BillDetailController');

const router = express.Router();

router.get('/billDetails', billDetailController.getBillDetails);

module.exports = router;