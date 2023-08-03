const stockRepository = require('../repositories/StockRepository');

const getStocks = async (req, res) => {
  try {
    const stocks = await stockRepository.getAllStocks();
    res.status(200).json(stocks);
  } catch (err) {
    console.error('Error fetching stocks:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getStocks,
};