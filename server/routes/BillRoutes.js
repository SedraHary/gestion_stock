const express = require('express');
const billController = require('../controllers/BillController');

const router = express.Router();

router.get('/bills', billController.getBills);

module.exports = router;