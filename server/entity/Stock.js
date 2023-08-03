class Stock {
    constructor(stockId, quantityInStock, stockLocation, stockAddDate, articleId ) {
      this.stockId = stockId;
      this.quantityInStock = quantityInStock;
      this.stockLocation = stockLocation;
      this.stockAddDate = stockAddDate;
      this.articleId = articleId;
      
    }
}
  
  module.exports = Stock;