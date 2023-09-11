const db = require('../db/db');
const Bill = require('../entity/Bill');

class BillRepository {
  async getAllBills() {
    try {
      const alldatas = [];
      const resultBill = await db.query('SELECT * FROM public.bill');
      for (const oneBill of resultBill.rows){
        var oneData = oneBill;
        const resultBillDetail = await db.query(`SELECT * FROM public.bill_detail WHERE bill_id =${oneBill.bill_id} ;`);
        oneData.detail = resultBillDetail.rows;

        alldatas.push(oneData);
      }
      return alldatas;
    } catch (err) {
      console.error('Error fetching bills:', err);
      throw new Error('Internal server error');
    }
  }

  async deleteBill(idBill) {
    try {
      const alldatas = [];
      await db.query(`DELETE FROM public.bill WHERE bill_id = ${idBill};`);
    } catch (err) {
      console.error('Error deleting bills:', err);
      throw new Error('Internal server error');
    }
  }

  async insertBill(agentId,remise,customerId,date,totalPrice,customerName, articleDatas) {
    
    try {
      const lastBillNum = await db.query(`SELECT MAX(bill_number) AS lastNumber FROM public.bill;`);
      const newBillNum = isNaN(parseInt(lastBillNum.rows[0].lastnumber)+1)? 1 : parseInt(lastBillNum.rows[0].lastnumber)+1;
      const remiseData = remise? remise : 0;
      const result = await db.query(`INSERT INTO public.bill(bill_id, bill_number, bill_total_price, bill_date, remise, id_customer, customer_name, agent_id) VALUES (DEFAULT, '${newBillNum}', '${totalPrice}', '${date}', '${remiseData}', '${customerId}', '${customerName}', '${agentId}') RETURNING bill_id;`);
      
      for (const articleData of articleDatas) {
        await db.query(`INSERT INTO public.bill_detail(bill_detail_id, quantity, unite_price, amount, bill_id, article_id) VALUES (DEFAULT, '${articleData.quantity}', '${articleData.price}', '${articleData.total}', '${result.rows[0].bill_id}', ${articleData.idArticle}) ;`);
        const quantityData = await db.query(`SELECT quantity FROM public.article WHERE articleId=${articleData.idArticle};`);
        const newQuantity = quantityData.rows[0].quantity-parseInt(articleData.quantity);
        await db.query(`UPDATE public.article SET quantity=${newQuantity} WHERE articleId=${articleData.idArticle};`);
      }
      return newBillNum;
    } catch (err) {
      console.error('Error fetching bills:', err);
      throw new Error('Internal server error');
    }
  }
  
}

module.exports = new BillRepository();
