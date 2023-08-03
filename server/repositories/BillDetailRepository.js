const db = require('../db/db');
const BillDetail = require('../entity/BillDetail');

class BillDetailRepository {
  async getAllBillDetails() {
    try {
      const result = await db.query('SELECT * FROM public.billDetail');
      //TODO:replace field database
      return result.rows.map((row) => new BillDetail(row.billDetailid, row.billDetailagentcode, row.billDetailname, row.billDetailtype, row.password));
    } catch (err) {
      console.error('Error fetching billDetails:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new BillDetailRepository();
