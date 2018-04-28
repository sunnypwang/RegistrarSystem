var express = require('express');
var app = express();
var http = require('http').Server(app);
var https = require('https');
var bodyParser = require('body-parser');
var session = require('express-session');
var db = require('./db');
var login = require('./login');
app.use(express.json());       // to support JSON-encoded bodies
app.use(express.urlencoded()); // to support URL-encoded bodies
app.set('trust proxy', 1)

var loggedin = false;
var userid;
var currentSemYear = 2018;
var currentSemNo = 1;

function isNumeric(num){
    return !isNaN(num)
}

// Add headers
app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3001');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});

//SESSION
app.use(session({
    key: 'user_sid',
    secret: 'nani koreeeeee',
    resave: true,
    saveUninitialized: true,
    cookie: { 
        secure: false,
        maxAge: 60 * 60 * 1000 // 1 hour
    } 
  }));

http.listen(3001, function(){
    console.log('started on port 3001');
});

app.get('/', function(req, res){
    res.sendFile('login.html', { root: __dirname });
});

app.post('/checksession',function(req,res){
    console.log(req.session);
});

// route for user logout
app.post('/logout', (req, res) => {
    //console.log("I'm at /logout");
    req.session.destroy();
    res.status(200).json({
        logoutSuccess : true
    });
});

app.post('/login', function(req, res){
    console.log(req.body.usertype,req.body.id,req.body.password);
    //these should be received from "HTML form" object
    var type = req.body.usertype;
    var result;
    if(type == "Student"){
        console.log(req.body.id);
        db.query('SELECT s.StudentID, s.password FROM student s WHERE s.StudentID = ?', [req.body.id], (err,rows) => {
            if(err){
                res.status(400).json({
                    message : 'Cannot retrieve login info'
                });
            }else {
                console.log(rows);
                if((rows[0] != undefined) || (rows[0] != null)){
                    if(rows[0].password == req.body.password){
                        
                        res.status(200).json({});
                        loggedin = true;
                        req.session.user = rows[0];
                        req.session.save();
                        //console.log(req.session.user);
                        return ;
                        //user_id = req.body.id;
                    }else{
                        console.log("password incorrect");
                        res.status(403).json({
                            success : false,
                            message : 'Invalid Password'
                        });
                        return ;
                        //res.sendFile('wrong.html', { root: __dirname });
                    }
                }else{
                    console.log("username incorrect");
                    res.status(403).json({
                        success : false,
                        message : 'Invalid Username'
                    });
                    return ;
                    //res.sendFile('wrong.html', { root: __dirname });
                }   
            }                
        });
    }
    
});

//example query
app.get("/courseinfo", function(req, res) {
    console.log("course info");
    console.log(req.session.user);
    //console.log(req.session.user.StudentID);
    db.query('SELECT * FROM course c WHERE c.CourseID LIKE ? ', [req.query.course_id + '%'], (err,rows) => {
        if(err){
            res.status(400).json({
                message : 'Cannot retrieve course info'
            });
        }else {
            res.json(rows);
            console.log(rows);
        }
    });
});

app.get("/facultyinfo", function(req, res) {
    console.log("faculty info");
    db.query('SELECT * FROM faculty f WHERE f.Fcode LIKE ? ', [req.query.fcode + '%'], (err,rows) => {
        if(err){
            res.status(400).json({
                message : 'Cannot retrieve faculty info'
            });
        }else {
            res.json(rows);
            console.log(rows);
        }
    });
});

app.get("/studentinfo", function(req, res) {
    console.log("student info");
    console.log(req.session.user);
    db.query(   'SELECT \
                    s.StudentID, \
                    s.FirstName, \
                    s.LastName, \
                    s.Title, \
                    s.Bdate, \
                    s.Sex, \
                    s.email, \
                    s.Number, \
                    s.Street, \
                    s.SubDistrict, \
                    s.Province, \
                    s.PostalCode, \
                    d.Dname, \
                    f.Fname \
                FROM student s, faculty f, department d \
                WHERE s.StudentID = ? AND s.Dcode = d.Dcode AND d.Fcode = f.Fcode', [req.session.user.StudentID], (err,rows) => {
        if(err){
            res.status(400).json({
                message : 'Cannot retrieve student info'
            });
        }else {
            res.json(rows);
            console.log(rows);
        }
    });
});

app.get("/viewregister", function(req, res) {
    console.log("view register");
    //get registered courses of a student
/*    db.query(   'SELECT r.ProgramCode, r.Year, r.SemesterNo, r.CourseID, c.CourseName, r.SecNo, r.registerResult \
                FROM register r \
                WHERE r.StudentID = ?', [req.session.user.StudentID], (err,rows) => {
        if(err){
            res.status(400).json({
                message : 'Cannot retrieve registered data'
            });
        }else {
            res.json(rows);
            console.log(rows);
        }
    });
    */
    db.query(   'SELECT r.ProgramCode, r.Year, r.SemesterNo, r.CourseID, c.CourseName, c.Credit, r.SecNo, r.registerResult \
            from register r,course c \
            WHERE r.StudentID = ? AND r.CourseID=c.CourseID',
            [req.session.user.StudentID],
            (err,rows) => {
            if(err){
                res.status(400).json({
                    message : 'Cannot retrieve registered data'
                });
            }else {
                res.json(rows);
                console.log(rows);
            }
    });
});

app.post("/register", function(req, res) {
    console.log("register");
    console.log(req.body);

    db.query('SELECT s.', [], (err,rows) => {
        if(err){
            res.status(404).json({
                success : false,
                message : 'Student ProgramCode not found'
            });
        } else {
            pcode = rows[0].ProgramCode;
            db.query('insert into register values (0,"X",?,?,?,?,?,?)', [req.session.user.StudentID,req.body.SecNo,req.body.CourseID,currentSemYear,currentSemNo,pcode], (err,rows) => {
                if(err){
                    res.status(400).json({
                        success : false,
                        message : 'Course/Section not found'
                    });
                } else {
                    res.status(200).json({});
                }
                
            });
        }
    });
    

});

app.get("/drop", function(req, res) {
    console.log("drop register");

    db.query('DELETE FROM register WHERE StudentID = ? and CourseID = ? and Year = ? and SemesterNo = ?', [req.session.user.StudentID,CourseID,currentSemYear,currentSemNo], (err,rows) => {
        if(err){
            res.status(400).json({
                message : 'Cannot remove this course'
            });
        }else {
            res.status(200).json({});
        }
    });

});

app.get("/transcript", function(req, res) {
    console.log("view grade");
    db.query(   'SELECT r.ProgramCode, r.Year, r.SemesterNo, r.CourseID, r.grade \
                FROM register r \
                WHERE r.StudentID = ?', [req.session.user.StudentID], (err,rows) => {
        if(err){
            res.status(400).json({
                message : 'Cannot retrieve student grade'
            });
        }else {
            res.json(rows);
            console.log(rows);
        }
        
        
    });
});

app.get("/certificate", function(req, res) {
    console.log("certificates requested");
    db.query(   'SELECT * \
                FROM certificate c \
                WHERE c.StudentID = ?', [req.session.user.StudentID], (err,rows) => {
        if(err){
            res.status(400).json({
                message : 'Cannot retrieve certificate data'
            });
        }else {
            res.json(rows);
            console.log(rows);
        }
    });
});
