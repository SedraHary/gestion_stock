const express = require('express');
const articleController = require('../controllers/ArticleController');

const router = express.Router();

router.get('/articles', articleController.getArticles);

module.exports = router;