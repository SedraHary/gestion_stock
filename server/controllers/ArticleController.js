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

module.exports = {
  getArticles,
};