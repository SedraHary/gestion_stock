const express = require('express');
const articleController = require('../controllers/ArticleController');

const router = express.Router();

router.get('/articles', articleController.getArticles);
router.post('/addArticle', articleController.addArticle);
router.post('/deleteArticle', articleController.deleteArticle);
router.post('/updateArticle', articleController.updateArticle);
router.post('/searchArticle', articleController.searchArticle);

module.exports = router;