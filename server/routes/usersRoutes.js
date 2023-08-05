const express = require('express');
const usersController = require('../controllers/UserController');

const router = express.Router();

router.get('/users', usersController.getUsers);
router.post('/login/user', usersController.getUserLoged);

module.exports = router;
