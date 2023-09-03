const db = require('../db/db');
const Article = require('../entity/Article');

class ArticleRepository {
  async getAllArticles() {
    try {
      const result = await db.query('SELECT * FROM public.article ORDER BY articleFamily ASC;');
      //TODO:replace field database
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa, row.quantity));
    } catch (err) {
      console.error('Error fetching articles:', err);
      throw new Error('Internal server error');
    }
  }

  async addArticle(articleFamily, articleName, articleDetail, articleUnit, articlePVDet, articlePvGros, articlePvRev, articlePa, quantity) {
    try {
      await db.query(`INSERT INTO public.article(articleid, articlefamily, articlename, articledetail, articleunit, articlepv_det, articlepv_gros, articlepv_rev, articlepa, quantity) VALUES (DEFAULT, '${articleFamily}', '${articleName}', '${articleDetail}', '${articleUnit}', ${articlePVDet}, ${articlePvGros}, ${articlePvRev}, ${articlePa}, ${quantity});`);
      const result = await db.query('SELECT * FROM public.article ORDER BY articleFamily ASC');
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa, row.quantity));
    } catch (err) {
      console.error('Error fetching article:', err);
      throw new Error('Internal server error');
    }
  }

  async deleteArticle(articleId) {
    try {
      await db.query(`DELETE FROM public.article WHERE articleid='${articleId}';`);
      const result = await db.query('SELECT * FROM public.article ORDER BY articleFamily ASC');
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa, row.quantity));
    } catch (err) {
      console.error('Error fetching article:', err);
      throw new Error('Internal server error');
    }
  }

  async updateArticle(articleId, articleFamily, articleName, articleDetail, articleUnit, articlePVDet, articlePvGros, articlePvRev, articlePa, quantity) {
    try {
      await db.query(`UPDATE public.article SET articlefamily='${articleFamily}', articlename='${articleName}', articledetail='${articleDetail}', articleunit='${articleUnit}', articlepv_det=${articlePVDet}, articlepv_gros=${articlePvGros}, articlepv_rev=${articlePvRev}, articlepa=${articlePa}, quantity=${quantity}  WHERE articleid='${articleId}';`);
      const result = await db.query('SELECT * FROM public.article ORDER BY articleFamily ASC');
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa, row.quantity));
    } catch (err) {
      console.error('Error fetching article:', err);
      throw new Error('Internal server error');
    }
  }

  async searchArticle(motCle) {
    try {
      const result = await db.query(`SELECT * FROM public.article WHERE articlefamily ILIKE '%${motCle}%' OR articlename ILIKE '%${motCle}%' OR articledetail ILIKE '%${motCle}%' OR articleunit ILIKE '%${motCle}%';`);
      // const result = await db.query('SELECT * FROM public.test ORDER BY articleFamily ASC');
      return result.rows.map((row) => new Article(row.articleid, row.articlefamily, row.articlename, row.articledetail, row.articleunit, row.articlepv_det, row.articlepv_gros, row.articlepv_rev, row.articlepa, row.quantity));
    } catch (err) {
      console.error('Error fetching article:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new ArticleRepository();
