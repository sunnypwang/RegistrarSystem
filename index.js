var express = require('express');
var app = express();
var http = require('http').Server(app);
var db = require('./db');
var login = require('./login');
app.use(express.json());       // to support JSON-encoded bodies
app.use(express.urlencoded()); // to support URL-encoded bodies

http.listen(3000, function(){
    console.log('started on port 3000');
});

var loggedin = false;
var userid;
app.get('/', function(req, res){
    res.sendFile('login.html', { root: __dirname });
});

app.post('/main', function(req, res){

    //these should be received from "HTML form" object
    var type = req.body.usertype;
    var result;
    if(type == "Student"){
        console.log(req.body.id);
        db.query('SELECT * FROM student s WHERE s.StudentID = ?', [req.body.id], (err,rows) => {
            if(err) throw err;
            
            if(rows[0] != undefined){
                if(rows[0].password == req.body.password){
                    res.sendFile('index.html', { root: __dirname });
                    loggedin = true;
                    userid = req.body.id;
                }else{
                    console.log("password incorrect");
                    res.sendFile('wrong.html', { root: __dirname });
                }
            }else{
                console.log("username incorrect");
                res.sendFile('wrong.html', { root: __dirname });
            }   
            
        });
    }else{
        db.query('SELECT * FROM instructor i WHERE i.InstID = ?', [req.body.id], (err,rows) => {
            if(err) throw err;

            if(rows[0] != undefined){
                if(rows[0].password == req.body.password){
                    res.sendFile('index.html', { root: __dirname });
                    loggedin = true;
                    userid = req.body.id;
                }else{
                    console.log("password incorrect");
                    res.sendFile('wrong.html', { root: __dirname });
                }
            }else{
                console.log("username incorrect");
                res.sendFile('wrong.html', { root: __dirname });
            }   
        });
    }
    
});


//example query
app.get("/courseinfo", function(req, res) {
    var course_id = req.query.course_id;
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

app.get("/studentinfo", function(req, res) {
    db.query('SELECT * FROM student s WHERE s.StudentID = ?', [userid], (err,rows) => {
        if(err) throw err;
        res.json(rows);
    });
});

app.get("/viewregister", function(req, res) {

    //get registered courses of a student
    db.query('select r.CourseID, r.SecNo \
    from register r \
    where r.StudentID = ?', [userid], (err,rows) => {
        if(err) throw err;
        res.json(rows);
    });

});

app.get("/register", function(req, res) {

    //these should be received from "HTML form" object
    var course_id = req.body.course_id;
    var sec_no = req.body.sec_no;
    //get registered courses of a student
    db.query('insert into register values (0,"X",?,?,?,2018,1,"CP")', [userid,SecNo,CourseID], (err,rows) => {
        if(err) throw err;
        res.json(rows);
    });

});

app.get("/viewgrade", function(req, res) {
    db.query('select r.CourseID, r.grade \
    from register r \
    where r.StudentID = ?', [userid], (err,rows) => {
        if(err) throw err;
        res.json(rows);
    });
});

