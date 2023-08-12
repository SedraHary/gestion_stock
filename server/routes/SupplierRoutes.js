const express = require('express');
const supplierController = require('../controllers/SupplierController');

const router = express.Router();

router.get('/suppliers', supplierController.getSuppliers);
router.get('/deleteSupplier', supplierController.deleteSupplier);
router.get('/updateSupplier', supplierController.updateSupplier);
router.get('/addSupplier', supplierController.addSupplier);

module.exports = router;