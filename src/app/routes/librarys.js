const express = require('express')
const router = express.Router()

const mysqlConnection = require('./../../config/dbConnection')

router.get('/users', (req, res) => {
    mysqlConnection.query('select * from UserInfo;', 
        (err, rows, fields) => {
            if (!err) {
                res.json(rows)
            } else {
                console.log(err)
            }
    })
})

router.get('/user-profile', (req, res) => {
    const { enrollment } = req.query
    mysqlConnection.query(`SELECT enrollment, birthdate, descriptionType, nameUser, phone, email FROM User AS U INNER JOIN userType AS T WHERE U.idType = T.idType and U.enrollment = ${enrollment}`, 
        (err, rows, fields) => {
            if (!err) {
                res.json(rows)
            } else {
                console.log(err)
            }
    })
})

router.get('/books', (req, res) => {
    mysqlConnection.query(`select * from BooksInfo;`, 
        (err, rows, fields) => {
            if (!err) {
                res.json(rows)
            } else {
                console.log(err)
            }
    })
})

router.get('')

module.exports = router
