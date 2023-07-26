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

module.exports = {
  getUsers,
};
