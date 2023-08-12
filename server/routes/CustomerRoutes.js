const express = require('express');
const customerController = require('../controllers/CustomerController');

const router = express.Router();

router.get('/customers', customerController.getCustomers);
router.get('/deleteCustomer', customerController.deleteCustomer);
router.get('/updateCustomer', customerController.updateCustomer);
router.get('/addCustomer', customerController.addCustomer);
module.exports = router;