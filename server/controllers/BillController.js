const billRepository = require('../repositories/BillRepository');

const getBills = async (req, res) => {
  try {
    const bills = await billRepository.getAllBills();
    res.status(200).json(bills);
  } catch (err) {
    console.error('Error fetching bills:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getBills,
};