const express = require('express');
const supplierController = require('../controllers/SupplierController');

const router = express.Router();

router.get('/suppliers', supplierController.getSuppliers);
router.post('/deleteSupplier', supplierController.deleteSupplier);
router.post('/updateSupplier', supplierController.updateSupplier);
router.post('/addSupplier', supplierController.addSupplier);

module.exports = router;