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

  async addSupplier(supplierName, supplierlastName, supplierContact) {
    try {
      await db.query(`INSERT INTO public.supplier (supplierid, suppliername, supplierlastname, supplier_contact) VALUES (DEFAULT, '${supplierName}', '${supplierlastName}', '${supplierContact}');`);
      const result = await db.query('SELECT supplierid, suppliername,supplierlastname, supplier_contact FROM public.supplier');
      return result.rows.map((row) => new Supplier(row.supplierid, row.suppliername, row.supplierlastname, row.supplier_contact));
    } catch (err) {
      console.error('Error fetching user:', err);
      throw new Error('Internal server error');
    }
  }

  async deleteSupplier(supplierId) {
    try {
      await db.query(`DELETE FROM public.supplier WHERE supplierid='${supplierId}';`);
      const result = await db.query('SELECT supplierid, suppliername, supplierlastname, supplier_contact FROM public.supplier');
      return result.rows.map((row) => new Supplier(row.supplierid, row.suppliername, row.supplierlastname, row.supplier_contact));
    } catch (err) {
      console.error('Error fetching Supplier:', err);
      throw new Error('Internal server error');
    }
  }

  async updateSupplier(supplierId, supplierName, supplierlastName, supplierContact) {
    try {
      await db.query(`UPDATE public.supplier SET suppliername=${supplierName}, supplierlastname='${supplierlastName}', supplier_contact='${supplierContact}' WHERE supplierid='${supplierId}';`);
      const result = await db.query('SELECT supplierid, suppliername, supplierlastname, supplier_contact FROM public.supplier');
      return result.rows.map((row) => new Supplier(row.supplierid, row.suppliername, row.supplierlastname, row.supplier_contact));
    } catch (err) {
      console.error('Error fetching user:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new SupplierRepository();
