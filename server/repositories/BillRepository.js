const db = require('../db/db');
const Bill = require('../entity/Bill');

class BillRepository {
  async getAllBills() {
    try {
      const result = await db.query('SELECT * FROM public.bill');
      //TODO:replace field database
      return result.rows.map((row) => new Bill(row.billid, row.billagentcode, row.billname, row.billtype, row.password));
    } catch (err) {
      console.error('Error fetching bills:', err);
      throw new Error('Internal server error');
    }
  }

  async insertBill(remise,customerId,date,totalPrice,customerName, articleDatas) {
    
    try {
      const lastBillNum = await db.query(`SELECT MAX(bill_number) AS lastNumber FROM public.bill;`);
      const newBillNum = isNaN(parseInt(lastBillNum.rows[0].lastnumber)+1)? 1 : parseInt(lastBillNum.rows[0].lastnumber)+1;
      const result = await db.query(`INSERT INTO public.bill(bill_id, bill_number, bill_total_price, bill_date, remise, id_customer, customer_name) VALUES (DEFAULT, '${newBillNum}', '${totalPrice}', '${date}', '${remise}', '${customerId}', '${customerName}') RETURNING bill_id;`);
      
      for (const articleData of articleDatas) {
        await db.query(`INSERT INTO public.bill_detail(bill_detail_id, quantity, unite_price, amount, bill_id, article_id) VALUES (DEFAULT, '${articleData.quantity}', '${articleData.price}', '${articleData.total}', '${result.rows[0].bill_id}', ${articleData.idArticle}) ;`);
      }
    } catch (err) {
      console.error('Error fetching bills:', err);
      throw new Error('Internal server error');
    }
  }
}

module.exports = new BillRepository();
