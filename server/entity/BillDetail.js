class BillDetail {
    constructor(billDetailId, quantity, unitePrice, amount, billId, articleId ) {
      this.billDetailId = billDetailId;
      this.quantity = quantity;
      this.unitePrice = unitePrice;
      this.amount = amount;
      this.billId = billId;
      this.articleId = articleId;
    }
}
  
  module.exports = BillDetail;