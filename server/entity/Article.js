class Article {
    constructor(articleId, articleFamily, articleName, articleDetail, articleUnit,articlePVDet, articlePvGros, articlePvRev, articlePa ) {
      this.articleId = articleId;
      this.articleFamily = articleFamily;
      this.articleName = articleName;
      this.articleDetail = articleDetail;
      this.articleUnit = articleUnit;
      this.articlePVDet = articlePVDet;
      this.articlePvGros = articlePvGros;
      this.articlePvRev = articlePvRev;
      this.articlePa = articlePa;
    }
}
  
  module.exports = Article;