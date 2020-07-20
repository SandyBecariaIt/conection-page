const express = require('express')
const router = express.Router()

const mysqlConnection = require('./../../config/dbConnectionMaps')

router.get('/maps', (req, res) => {
    mysqlConnection.query('SELECT * FROM Student;', (err, rows, fields) => {
        if (!err) {
            res.json(rows)
        } else {
            console.log(err)
        }
    })
})
