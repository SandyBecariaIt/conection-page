const dbConnection = require('./../../config/dbConnection')

module.exports = app => {
    const connection = dbConnection()

    app.get('/', (req, res) => {
        
        connection.query('SELECT * FROM sector;', (err, res) => {
            if (!err) {
                res.json()
            } else {
                console.log(err)
            }
            
        })

    })
}
