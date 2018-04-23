var mysql = require('mysql');
var con = mysql.createConnection({
    host: 'localhost',    //set your mySQL hostname
    user: 'root',         //set your mySQL username
<<<<<<< HEAD
    password: 'Wewereacsp_7',     //set your mySQL password
=======
    password: 'root1234',     //set your mySQL password
>>>>>>> origin/master
    database: 'registrar'   //set your database name in your local computer
});

con.connect((err) => {
    if (err) throw err;
    console.log('Connected!');
});
module.exports=con;