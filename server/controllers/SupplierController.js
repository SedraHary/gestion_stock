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

module.exports = {
  getSuppliers,
};