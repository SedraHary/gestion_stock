const articleRepository = require('../repositories/ArticleRepository');

const getArticles = async (req, res) => {
  try {
    const articles = await articleRepository.getAllArticles();
    res.status(200).json(articles);
  } catch (err) {
    console.error('Error fetching articles:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const addArticle = async (req, res) => {
  try {
    const article = req.body;
    const articleResponse = await articleRepository.addArticle(article.articleFamily, article.articleName, article.articleDetail, article.articleUnit, article.articlePVDet, article.articlePvGros, article.articlePvRev, article.articlePa, article.articleQuantity);
    res.status(200).json(articleResponse);
  } catch (err) {
    console.error('Error fetching articles:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const deleteArticle = async (req, res) => {
  try {
    const article = req.body;
    const articleResponse = await articleRepository.deleteArticle(article.articleId);
    res.status(200).json(articleResponse);
  } catch (err) {
    console.error('Error fetching articles:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const updateArticle = async (req, res) => {
  try {
    const article = req.body;
    const artilceResponse = await articleRepository.updateArticle(article.articleId, article.articleFamily, article.articleName, article.articleDetail, article.articleUnit, article.articlePVDet, article.articlePvGros, article.articlePvRev, article.articlePa, article.articleQuantity);
    res.status(200).json(artilceResponse);
  } catch (err) {
    console.error('Error fetching articles:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const searchArticle = async (req, res) => {
  try {
    const article = req.body;
    const artilceResponse = await articleRepository.searchArticle(article.motCle);
    res.status(200).json(artilceResponse);
  } catch (err) {
    console.error('Error fetching articles:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getArticles,
  addArticle,
  deleteArticle,
  updateArticle,
  searchArticle
};