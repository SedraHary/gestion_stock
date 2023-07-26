const db = require('../db/db');
const User = require('../entity/User');

class UserRepository {
  async getAllUsers() {
    try {
      const result = await db.query('SELECT * FROM public.user');
      return result.rows.map((row) => new User(row.userid, row.useragentcode, row.username, row.usertype, row.password));
    } catch (err) {
      console.error('Error fetching users:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new UserRepository();
