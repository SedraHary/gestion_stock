const db = require('../db/db');
const Store = require('../entity/Store');

class StoreRepository {
  async getAllStores() {
    try {
      const result = await db.query('SELECT * FROM public.store');
      //TODO:replace field database
      return result.rows.map((row) => new Store(row.storeid, row.storeagentcode, row.storename, row.storetype, row.password));
    } catch (err) {
      console.error('Error fetching stores:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new StoreRepository();
