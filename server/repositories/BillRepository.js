const db = require('../db/db');
const Bill = require('../entity/Bill');

class BillRepository {
  async getAllBills() {
    try {
      const result = await db.query('SELECT * FROM public.bill');
      //TODO:replace field database
      return result.rows.map((row) => new Bill(row.billid, row.billagentcode, row.billname, row.billtype, row.password));
    } catch (err) {
      console.error('Error fetching bills:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new BillRepository();
