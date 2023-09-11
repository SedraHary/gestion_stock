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

const addBill = async (req, res) => {
  try {
    const bill = req.body;
    const billResponse = await billRepository.insertBill(bill.remise, bill.clientId, bill.dateFacture, bill.totalAvant, bill.client, bill.articleData);
    res.status(200).json(billResponse);
  } catch (err) {
    console.error('Error fetching bills:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

const deleteBill = async (req, res) => {
  try {
    const bill = req.body;
    const billResponse = await billRepository.deleteBill(bill.idFacture);
    res.status(200).json(billResponse);
  } catch (err) {
    console.error('Error deleting bills:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  getBills,
  addBill,
  deleteBill,
};