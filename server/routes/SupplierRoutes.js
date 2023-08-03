const express = require('express');
const supplierController = require('../controllers/SupplierController');

const router = express.Router();

router.get('/suppliers', supplierController.getSuppliers);

module.exports = router;