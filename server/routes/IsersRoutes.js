const express = require('express');
const usersController = require('../controllers/UserController');

const router = express.Router();

router.get('/users', usersController.getUsers);
router.post('/login/user', usersController.getUserLoged);
router.post('/addUser', usersController.addUser);
router.post('/deleteUser', usersController.deleteUser);
router.post('/updateUser', usersController.updateUser);

module.exports = router;
