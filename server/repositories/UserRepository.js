const db = require('../db');
const User = require('../models/User');

class UserRepository {
  async getAllUsers() {
    try {
      const result = await db.query('SELECT * FROM users');
      return result.rows.map((row) => new User(row.id, row.name, row.email));
    } catch (err) {
      console.error('Error fetching users:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new UserRepository();
