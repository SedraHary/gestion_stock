const db = require('../db/db');
const User = require('../entity/User');

class UserRepository {
  async getAllUsers() {
    try {
      const result = await db.query('SELECT userid,useragentcode,username,usertype FROM public.user');
      return result.rows.map((row) => new User(row.userid, row.useragentcode, row.username, row.usertype, row.password));
    } catch (err) {
      console.error('Error fetching users:', err);
      throw new Error('Internal server error');
    }
  }

  async getUserLoged(username, password) {
    try {
      const result = await db.query(`SELECT * FROM public.user where username='${username}' and password='${password}' `);
      return result.rows.map((row) => new User(row.userid, row.useragentcode, row.username, row.usertype, row.password));
    } catch (err) {
      console.error('Error fetching user:', err);
      throw new Error('Internal server error');
    }
  }

  async addUser(userAgentCode, userName, userType, password) {
    try {
      await db.query(`INSERT INTO public.user(userid, useragentcode, username, usertype, password) VALUES (DEFAULT, '${userAgentCode}', '${userName}', '${userType}', '${password}');`);
      const result = await db.query('SELECT userid,useragentcode,username,usertype FROM public.user');
      return result.rows.map((row) => new User(row.userid, row.useragentcode, row.username, row.usertype, row.password));
    } catch (err) {
      console.error('Error fetching user:', err);
      throw new Error('Internal server error');
    }
  }

  async deleteUser(userId) {
    try {
      await db.query(`DELETE FROM public.user WHERE userid='${userId}';`);
      const result = await db.query('SELECT userid,useragentcode,username,usertype FROM public.user');
      return result.rows.map((row) => new User(row.userid, row.useragentcode, row.username, row.usertype, row.password));
    } catch (err) {
      console.error('Error fetching user:', err);
      throw new Error('Internal server error');
    }
  }

  async updateUser(userId, userAgentCode, userName, userType, password) {
    try {
      await db.query(`UPDATE public.user SET useragentcode=${userAgentCode}, username='${userName}', usertype='${userType}', password='${password}' WHERE userid='${userId}';`);
      const result = await db.query('SELECT userid,useragentcode,username,usertype FROM public.user');
      return result.rows.map((row) => new User(row.userid, row.useragentcode, row.username, row.usertype, row.password));
    } catch (err) {
      console.error('Error fetching user:', err);
      throw new Error('Internal server error');
    }
  }

}

module.exports = new UserRepository();
