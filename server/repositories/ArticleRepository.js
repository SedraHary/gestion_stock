const db = require('../db/db');
const Article = require('../entity/Article');

class ArticleRepository {
  async getAllArticles() {
    try {
      const result = await db.query('SELECT * FROM public.test');
      //TODO:replace field database
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa));
    } catch (err) {
      console.error('Error fetching articles:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new ArticleRepository();
