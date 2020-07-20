const express = require('express')
const router = express.Router()

const mysqlConnection = require('./../../config/dbConnection')
const mysqlMaps = require('./../../config/dbConnectionMaps')

router.get('/users', (req, res) => {
    mysqlConnection.query('SELECT * FROM Users;', (err, rows, fields) => {
        if (!err) {
            res.json(rows)
        } else {
            console.log(err)
        }
    })
})

router.get('/ingredient', (req, res) => {
    mysqlConnection.query('SELECT * FROM Ingredients;', (err, rows, fields) => {
        if (!err) {
            res.json(rows)
        } else {
            console.log(err)
        }
    })
})

router.get('/report', (req, res) => {
    mysqlConnection.query(`SELECT O.idOrder, W.descriptionW, O.saleTotal, O.saleDate FROM OrderFoodm AS O 
        INNER JOIN Waiters AS W WHERE O.saleDate BETWEEN '2020-04-19' AND '2020-07-19';`, (err, rows, fields) => {
        if (!err) {
            res.json(rows)
        } else {
            console.log(err)
        }
    })
})

router.get('/maps', (req, res) => {
    mysqlMaps.query(`SELECT * FROM Student;`, (err, rows, fields) => {
        if (!err) {
            res.json(rows)
        } else {
            console.log(err)
        }
    })
})

module.exports = router
