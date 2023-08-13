const express = require('express');
const customerController = require('../controllers/CustomerController');

const router = express.Router();

router.get('/customers', customerController.getCustomers);
router.post('/deleteCustomer', customerController.deleteCustomer);
router.post('/updateCustomer', customerController.updateCustomer);
router.post('/addCustomer', customerController.addCustomer);
module.exports = router;