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
const utils = require('./utilsService');
app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, '../public')));

// Route pour "/dashboard"
app.get('/dashboard', (req, res) => {
  // Servez le fichier dashboard.html
  res.sendFile(path.join(__dirname, '../public', 'dashboard.html'));
});

app.post('/generate-bill', (req, res) => {
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
    // doc.image(path.join(__dirname, '../public/assets/img', 'logo.jpg'), { width: 200, align: 'center' });
    // Calculate the X-coordinate to center the image
    const pdfWidth = doc.page.width; // Get the width of the PDF document
    const imageWidth = 170; // Adjust this based on your image's actual width
    const centerX = (pdfWidth - imageWidth) / 2;
    const todayDate = '12-07-2023 à 00:00'
    const numTicket = '0002'
    doc.image(path.join(__dirname, '../public/assets/img', 'logo.jpg'), centerX, 40, { width: imageWidth });
    doc.text('Lot 1116K 256 Mahazoarivo Nord', centerX, 110)
    doc.text('0341450158 / 0330962066', centerX+15, 120)
    doc.fillColor('blue'); // Set text color to blue
    doc.text('qqienathan@gmail.com', centerX+20, 130)

    doc.fillColor('black'); // Set text color to blue
    doc.text('Agent : ', 40, 160)
    doc.text('CLIENT : ', pdfWidth-150, 160)
    doc.font('Helvetica-Bold'); // Set font to bold
    doc.text('FACT N° ', centerX+40, 175)
    //num Facture donnée
    // doc.text(num, centerX+40, 130)

    const currentDate = new Date();
    // Get the current date in the format "YYYY-MM-DD"
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const day = String(currentDate.getDate()).padStart(2, '0');
    const formattedDate = `${day}-${month}-${year}`;

    // Get the current time in the format "HH:MM:SS"
    const hours = String(currentDate.getHours()).padStart(2, '0');
    const minutes = String(currentDate.getMinutes()).padStart(2, '0');
    const seconds = String(currentDate.getSeconds()).padStart(2, '0');
    const formattedTime = `${hours}:${minutes}:${seconds}`;
    doc.fontSize(11);
    doc.text('Ticket N° '+numTicket+' du '+formattedDate+' à '+formattedTime, 40, 190)

    const tableData = [
      ['Désignation', 'Qté', 'Uté', 'P*U','Montant'],
      ['Row 1 Cell 1', 'Row 1 Cell 2', 'Row 1 Cell 3', 'Row 1 Cell 4', 'Row 1 Cell 5'],
      ['Row 2 Cell 1', 'Row 2 Cell 2', 'Row 2 Cell 3', 'Row 2 Cell 4', 'Row 2 Cell 5'],
    ];

    const tableTop = 210;
    const tableLeft = 40;
    const colWidth = 75;
    const rowHeight = 20;

    doc.font('Helvetica-Bold');
    doc.fontSize(10);

    // Draw table headers
    drawCell(tableData[0], tableTop, true);

    // Draw table rows
    for (let i = 1; i < tableData.length; i++) {
      drawCell(tableData[i], tableTop + i * rowHeight);
    }

    function drawCell(data, y, isHeader = false) {
      for (let i = 0; i < data.length; i++) {
          const x = tableLeft + i * colWidth;
          const content = data[i].toString();
          
          if (isHeader) {
            doc.rect(x, y, colWidth, rowHeight).fillAndStroke('#D3D3D3', '#000');
            doc.fillColor('#000').text(content, x + 5, y + 5, { width: colWidth - 10, align: 'center' });
          } else {
            doc.rect(x, y, colWidth, rowHeight).stroke();
            doc.text(content, x + 5, y + 5, { width: colWidth - 10, align: 'center' });
          }
      }
    }
    const total = 200000
    const remise = "cent mille"
    const sommeChiffre = 405079
    const sommeLettre = utils.convertAmountToWords(sommeChiffre)
    
    doc.moveDown();
    doc.text('Total : '+total+' Ar',centerX+50 )
    doc.moveDown();
    doc.text('Remise : '+remise+' Ar',centerX+50 )
    doc.moveDown();
    doc.text('Total à payer : '+sommeChiffre+' Ar',centerX+50 )
    doc.moveDown();
    doc.text('Arrêtée la présente facture à la somme de : '+sommeLettre+' Ariary',40 )
     


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
