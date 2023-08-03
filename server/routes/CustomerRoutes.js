const express = require('express');
const customerController = require('../controllers/CustomerController');

const router = express.Router();

router.get('/customers', customerController.getCustomers);

module.exports = router;