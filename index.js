var app = require('express')();
var http = require('http').Server(app);
const mysql = require('mysql');
const db = mysql.createConnection({
  host: 'localhost',    //set your mySQL hostname
  user: '',         //set your mySQL username
  password: '',     //set your mySQL password
  database: ''   //set your database name in your local computer
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected!');
});

app.get('/', function(req, res){
    res.sendFile('index.html', { root: __dirname });
});

http.listen(3000, function(){
    console.log('started on port 3000');
});

//example query
app.get("/courseinfo", function(req, res) {
    var course_id = req.query.id;
    db.query('SELECT * FROM course c WHERE c.CourseID = ?', [course_id], (err,rows) => {
        if(err) throw err;
        res.json(rows);
    });
});

app.get("/facultyinfo", function(req, res) {
    var fcode = req.query.code;
    db.query('SELECT * FROM faculty f WHERE f.Fcode = ?', [fcode], (err,rows) => {
        if(err) throw err;
        res.json(rows);
    });
});




