const db = require('../db/db');
const Article = require('../entity/Article');

class ArticleRepository {
  async getAllArticles() {
    try {
      const result = await db.query('SELECT * FROM public.article');
      //TODO:replace field database
      return result.rows.map((row) => new Article(row.articleid, row.articleagentcode, row.articlename, row.articletype, row.password));
    } catch (err) {
      console.error('Error fetching articles:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new ArticleRepository();
