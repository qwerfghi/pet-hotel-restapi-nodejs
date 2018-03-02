var express = require('express');
var router = express.Router();
var connection = require('../connection');

router.get('/', function (req, res) {
    connection.query('select * from staff', function (error, results, fields) {
        if (error) throw error;
        res.json(results);
    });
});

router.get('/:id', function (req, res) {
    connection.query('select * from staff where idstaff=?', [req.params.id], function (error, results, fields) {
        if (error) throw error;
        res.json(results);
    });
});

//rest api to create a new customer record into mysql database
router.post('/', function (req, res) {
    var params = req.body;
    console.log(params);
    connection.query('INSERT INTO staff SET ?', params, function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

//rest api to update record into mysql database
router.put('/', function (req, res) {
    connection.query('UPDATE `staff` SET `Name`=?,`Address`=?,`Country`=?,`Phone`=? where `Id`=?', [req.body.Name, req.body.Address, req.body.Country, req.body.Phone, req.body.Id], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

//rest api to delete record from mysql database
router.delete('/', function (req, res) {
    console.log(req.body);
    connection.query('DELETE FROM `staff` WHERE `idstaff`=?', [req.body.Id], function (error, results, fields) {
        if (error) throw error;
        res.end('Record has been deleted!');
    });
});

module.exports = router;