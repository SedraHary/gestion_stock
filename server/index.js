const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const usersRoutes = require('./routes/UsersRoutes');
const articleRoutes = require('./routes/ArticleRoutes');
const billDetailRoutes = require('./routes/BillDetailRoutes');
const billRoutes = require('./routes/BillRoutes');
const customerRoutes = require('./routes/CustomerRoutes');
const stockRoutes = require('./routes/StockRoutes');
const storeRoutes = require('./routes/StoreRoutes');
const supplierRoutes = require('./routes/SupplierRoutes');
const path = require('path');
const fs = require("fs");
const PDFDocument = require('pdfkit');

const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, '../public')));

// Route pour "/dashboard"
app.get('/dashboard', (req, res) => {
  // Servez le fichier dashboard.html
  res.sendFile(path.join(__dirname, '../public', 'dashboard.html'));
});

app.post('/generate-bill', (req, res) => {console.log(req)
  const { customerName, items } = req.body;

    // Create a PDF document
    const doc = new PDFDocument({
      size: [400, 500], // Width and height in points
    });
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', 'attachment; filename=sales_bill.pdf');
    
    // Generate the PDF content
    doc.pipe(res);
    
    // Customize the layout using PDFKit
    doc.image(path.join(__dirname, '../public/assets/img', 'logo.jpg'), { width: 200 })
        .text('Lot 1116K 256 Mahazoarivo Nord', 100, 100)
        .text('0341450158 / 0330962066', 100, 130)
        .text('qqienathan@gmail.com', 100, 160)
        .text(`Customer: ${customerName}`, 100, 200);

    // ... Add more content customization here

    // // Add user input items to the PDF
    // const tableStartY = 300;
    // let y = tableStartY;
    // doc.moveDown();
    
    // doc.fontSize(12).text('Désignation', 50, y);
    // doc.text('Qté', 200, y);
    // doc.text('Uté', 300, y);
    // doc.text('P*U (Ar TTC)', 400, y);
    // doc.text('Montant (Ar TTC)', 500, y);
    // y += 20;

    // for (const item of items) {
    //     doc.fontSize(12).text(item.name, 50, y);
    //     doc.text(item.quantity.toString(), 200, y);
    //     doc.text(item.unit, 300, y);
    //     doc.text(item.price.toString(), 400, y);
    //     doc.text(item.total.toString(), 500, y);
    //     y += 20;
    // }

    // // Calculate and display total
    // const total = items.reduce((sum, item) => sum + parseFloat(item.total), 0);
    // y += 20;
    // doc.moveDown();
    // doc.fontSize(14).text(`TOTAL : ${total}`, { align: 'right', width: 500, height: 20 });

    // // ... Customize and add more content as needed

    doc.end();
});

app.use('/api', usersRoutes);
app.use('/api', articleRoutes);
app.use('/api', billDetailRoutes);
app.use('/api', billRoutes);
app.use('/api', customerRoutes);
app.use('/api', stockRoutes);
app.use('/api', storeRoutes);
app.use('/api', supplierRoutes);

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
