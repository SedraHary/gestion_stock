const db = require('../db/db');
const Customer = require('../entity/Customer');

class CustomerRepository {
  async getAllCustomers() {
    try {
      const result = await db.query('SELECT * FROM public.customer');
      //TODO:replace field database
      return result.rows.map((row) => new Customer(row.customerid, row.customername, row.customerlastname, row.customer_contact, row.customercode));
    } catch (err) {
      console.error('Error fetching customers:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new CustomerRepository();
