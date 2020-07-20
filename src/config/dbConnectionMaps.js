var mysql = require('mysql')

const mysqlConnection =  mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'sasa',
    database : 'AppSchool'
})


mysqlConnection.connect(function (err) {
    if (err) {
        console.log(err)
        return
    } else {
        console.log('BD conectada')
    }
})

module.exports = mysqlConnection
