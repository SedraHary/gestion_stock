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

const addCustomer = async (req, res) => {
  try {
    const customer = req.body;
    const customerResponse = await customerRepository.addCustomer(customer.customerName, customer.customerLastName, customer.customerContact, customer.customerCode);
    res.status(200).json(customerResponse);
  } catch (err) {
    console.error('Error adding Customer:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const deleteCustomer = async (req, res) => {
  try {
    const customer = req.body;
    const customerResponse = await customerRepository.deleteCustomer(customer.customerId);
    res.status(200).json(customerResponse);
  } catch (err) {
    console.error('Error deleting Customer:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const updateCustomer = async (req, res) => {
  try {
    const customer = req.body;
    const customerResponse = await customerRepository.updateCustomer(customer.customerId, customer.customerName, customer.customerLastName, customer.customerContact, customer.customerCode);
    res.status(200).json(customerResponse);
  } catch (err) {
    console.error('Error updating Customer:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getCustomers,
  addCustomer,
  deleteCustomer,
  updateCustomer
};