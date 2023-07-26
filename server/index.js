const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const usersRoutes = require('./routes/usersRoutes');

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use('/api', usersRoutes);

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
