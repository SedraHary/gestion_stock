const express = require('express');
const billController = require('../controllers/BillController');

const router = express.Router();

router.get('/bills', billController.getBills);
router.post('/addBill', billController.addBill);

module.exports = router;