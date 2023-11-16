const mysql = require('mysql');

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    port: 3306,
    database: "online_hair",
});

connection.connect((error) => {
    if (error)
        throw error;
    console.log("Connected to the database");
})

module.exports = connection;
