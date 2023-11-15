require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors');
//const fileUpload = require('express-fileupload');
const db = require('./db');
const path = require('path');

const router = require('./routers/routers');
const authErr = require('./middleware/auth');
const errorManage = require('./middleware/errManage');

app.use(cors());
app.use(express.json());

app.use(express.static(path.resolve(__dirname, 'img')));
//app.use(fileUpload({}));
app.use('/api', router);
app.use(authErr);
app.use(errorManage);


app.listen(3800, () => {
    console.log("Server listening on port 3800");
});
      





