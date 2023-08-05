const userRepository = require('../repositories/UserRepository');

const getUsers = async (req, res) => {
  try {
    const users = await userRepository.getAllUsers();
    res.status(200).json(users);
  } catch (err) {
    console.error('Error fetching users:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const getUserLoged = async (req, res) => {
  try {
    const user = req.body;
    const userResponse = await userRepository.getUserLoged(user.username, user.password);
    res.status(200).json(userResponse);
  } catch (err) {
    console.error('Error fetching users:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getUsers,
  getUserLoged
};
