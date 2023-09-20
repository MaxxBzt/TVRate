const express = require('express');
const app = express();

app.use(express.static('views'));

app.get('/', (req, res) => {
    console.log("Hello World!");
    res.render('index');
})

app.listen(5500);