const billDetailRepository = require('../repositories/BillDetailRepository');

const getBillDetails = async (req, res) => {
  try {
    const billDetails = await billDetailRepository.getAllBillDetails();
    res.status(200).json(billDetails);
  } catch (err) {
    console.error('Error fetching billDetails:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getBillDetails,
};