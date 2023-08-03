const customerRepository = require('../repositories/CustomerRepository');

const getCustomers = async (req, res) => {
  try {
    const customers = await customerRepository.getAllCustomers();
    res.status(200).json(customers);
  } catch (err) {
    console.error('Error fetching customers:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getCustomers,
};