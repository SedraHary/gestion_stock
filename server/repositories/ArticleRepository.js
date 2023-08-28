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

  async addArticle(articleFamily, articleName, articleDetail, articleUnit, articlePVDet, articlePvGros, articlePvRev, articlePa) {
    try {
      await db.query(`INSERT INTO public.test(articleid, articlefamily, articlename, articledetail, articleunit, articlepv_det, articlepv_gros, articlepv_rev, articlepa) VALUES (DEFAULT, '${articleFamily}', '${articleName}', '${articleDetail}', '${articleUnit}', ${articlePVDet}, ${articlePvGros}, ${articlePvRev}, ${articlePa});`);
      const result = await db.query('SELECT * FROM public.test');
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa));
    } catch (err) {
      console.error('Error fetching article:', err);
      throw new Error('Internal server error');
    }
  }

  async deleteArticle(articleId) {
    try {
      await db.query(`DELETE FROM public.test WHERE articleid='${articleId}';`);
      const result = await db.query('SELECT * FROM public.test');
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa));
    } catch (err) {
      console.error('Error fetching article:', err);
      throw new Error('Internal server error');
    }
  }

  async updateArticle(articleId, articleFamily, articleName, articleDetail, articleUnit, articlePVDet, articlePvGros, articlePvRev, articlePa) {
    try {
      await db.query(`UPDATE public.test SET articlefamily='${articleFamily}', articlename='${articleName}', articledetail='${articleDetail}', articleunit='${articleUnit}', articlepv_det=${articlePVDet}, articlepv_gros=${articlePvGros}, articlepv_rev=${articlePvRev}, articlepa=${articlePa}  WHERE articleid='${articleId}';`);
      const result = await db.query('SELECT * FROM public.test');
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa));
    } catch (err) {
      console.error('Error fetching article:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new ArticleRepository();
