const express = require('express');
const articleController = require('../controllers/ArticleController');

const router = express.Router();

router.get('/articles', articleController.getArticles);
router.post('/addArticle', articleController.addArticle);
router.post('/deleteArticle', articleController.deleteArticle);
router.post('/updateArticle', articleController.updateArticle);

module.exports = router;