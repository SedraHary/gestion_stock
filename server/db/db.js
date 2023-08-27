const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: '127.0.0.1',
  database: 'template1',
  password: '123456',
  // port: 5432,
  port: 5433,
});

module.exports = {
  query: (text, params) => pool.query(text, params),
};