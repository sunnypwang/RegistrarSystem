var mysql = require('mysql');
var con = mysql.createConnection({
    host: 'localhost',    //set your mySQL hostname
    user: '',         //set your mySQL username
    password: '',     //set your mySQL password
    database: 'registrar'   //set your database name in your local computer
});

con.connect((err) => {
    if (err) throw err;
    console.log('Connected!');
});
module.exports=con;