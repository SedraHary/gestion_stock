const supplierRepository = require('../repositories/SupplierRepository');

const getSuppliers = async (req, res) => {
  try {
    const suppliers = await supplierRepository.getAllSuppliers();
    res.status(200).json(suppliers);
  } catch (err) {
    console.error('Error fetching suppliers:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const addSupplier = async (req, res) => {
  try {
    const supplier = req.body;
    const supplierResponse = await supplierRepository.addSupplier(supplier.fournisseurName, supplier.fournisseurLastName, supplier.fournisseurContact);
    res.status(200).json(supplierResponse);
  } catch (err) {
    console.error('Error adding supplier:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const deleteSupplier = async (req, res) => {
  try {
    const supplier = req.body;
    const supplierResponse = await supplierRepository.deleteSupplier(supplier.fournisseurId);
    res.status(200).json(supplierResponse);
  } catch (err) {
    console.error('Error deleting supplier:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const updateSupplier = async (req, res) => {
  try {
    const supplier = req.body;
    const supplierResponse = await supplierRepository.updateSupplier(supplier.fournisseurId, supplier.fournisseurName, supplier.fournisseurLastName, supplier.fournisseurContact);
    res.status(200).json(supplierResponse);
  } catch (err) {
    console.error('Error updating supplier:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};
module.exports = {
  getSuppliers,
  addSupplier,
  updateSupplier,
  deleteSupplier
};