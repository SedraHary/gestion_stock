const storeRepository = require('../repositories/StoreRepository');

const getStores = async (req, res) => {
  try {
    const stores = await storeRepository.getAllStores();
    res.status(200).json(stores);
  } catch (err) {
    console.error('Error fetching stores:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getStores,
};