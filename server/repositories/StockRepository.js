const db = require('../db/db');
const Stock = require('../entity/Stock');

class StockRepository {
  async getAllStocks() {
    try {
      const result = await db.query('SELECT * FROM public.stock');
      //TODO:replace field database
      return result.rows.map((row) => new Stock(row.stockid, row.stockagentcode, row.stockname, row.stocktype, row.password));
    } catch (err) {
      console.error('Error fetching stocks:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new StockRepository();
