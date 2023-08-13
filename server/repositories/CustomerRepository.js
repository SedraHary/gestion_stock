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

  async addCustomer(customerName, customerlastName, customerContact, customerCode) {
    try {
      await db.query(`INSERT INTO public.customer (customerid, customername, customerlastname, customer_contact,customerCode) VALUES (DEFAULT, '${customerName}', '${customerlastName}', '${customerContact}', '${customerCode}');`);
      const result = await db.query('SELECT customerid, customername,customerlastname, customer_contact, customerCode FROM public.customer');
      return result.rows.map((row) => new Customer(row.customerid, row.customername, row.customerlastname, row.customer_contact, row.customerCode));
    } catch (err) {
      console.error('Error fetching customer:', err);
      throw new Error('Internal server error');
    }
  }

  async deleteCustomer(customerId) {
    try {
      await db.query(`DELETE FROM public.customer WHERE customerid='${customerId}';`);
      const result = await db.query('SELECT customerid, customername, customerlastname, customer_contact FROM public.customer');
      return result.rows.map((row) => new Customer(row.customerid, row.customername, row.customerlastname, row.customer_contact));
    } catch (err) {
      console.error('Error fetching Customer:', err);
      throw new Error('Internal server error');
    }
  }

  async updateCustomer(customerId, customerName, customerlastName, customerContact,customerCode) {
    try {
      await db.query(`UPDATE public.customer SET customername='${customerName}', customerlastname='${customerlastName}', customer_contact='${customerContact}', customercode='${customerCode}' WHERE customerid='${customerId}';`);
      const result = await db.query('SELECT customerid, customername, customerlastname, customer_contact, customercode FROM public.customer');
      return result.rows.map((row) => new Customer(row.customerid, row.customername, row.customerlastname, row.customer_contact, row.customercode));
    } catch (err) {
      console.error('Error fetching customer:', err);
      throw new Error('Internal server error');
    }
  }

}

module.exports = new CustomerRepository();
