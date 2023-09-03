class Article {
    constructor(articleId, articleFamily, articleName, articleDetail, articleUnit,articlePVDet, articlePvGros, articlePvRev, articlePa, articleQuantity ) {
      this.articleId = articleId;
      this.articleFamily = articleFamily;
      this.articleName = articleName;
      this.articleDetail = articleDetail;
      this.articleUnit = articleUnit;
      this.articlePVDet = articlePVDet;
      this.articlePvGros = articlePvGros;
      this.articlePvRev = articlePvRev;
      this.articlePa = articlePa;
      this.articleQuantity = articleQuantity;
    }
}
  
  module.exports = Article;