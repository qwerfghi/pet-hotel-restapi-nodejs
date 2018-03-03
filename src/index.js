var express = require('express');
var app = express();
var cors = require('cors');
var bodyParser = require('body-parser');

app.use(bodyParser.json());       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));
app.use(cors({credentials: true, origin: true})); //enable cors

//create app server
var server = app.listen(3000, "127.0.0.1", function () {
    var host = server.address().address;
    var port = server.address().port;

    console.log("Example app listening at http://%s:%s", host, port)
});

app.use('/employees', require('./controllers/employees'));
app.use('/address', require('./controllers/address'));
app.use('/pets', require('./controllers/pets'));
app.use('/visitors', require('./controllers/visitors'));