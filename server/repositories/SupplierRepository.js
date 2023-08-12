const db = require('../db/db');
const Supplier = require('../entity/Supplier');

class SupplierRepository {
  async getAllSuppliers() {
    try {
      const result = await db.query('SELECT * FROM public.supplier');
      //TODO:replace field database
      return result.rows.map((row) => new Supplier(row.supplierid, row.suppliername, row.supplierlastname, row.supplier_contact));
    } catch (err) {
      console.error('Error fetching suppliers:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new SupplierRepository();
