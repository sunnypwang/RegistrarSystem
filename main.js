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
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 60 * 60 * 1000 } // 1 hour
  }));

/*
// This middleware will check if user's cookie is still saved in browser and user is not set, then automatically log the user out.
// This usually happens when you stop your express server after login, your cookie still remains saved in the browser.
app.use((req, res, next) => {
    if (req.cookies.user_sid && !req.session.user) {
        res.clearCookie('user_sid');        
    }
    next();
});
*/

// middleware function to check for logged-in users
var sessionChecker = (req, res, next) => {
    //if (req.session.user && req.cookies.user_sid) {
    if (req.session.user){
        res.redirect('/');
    } else {
        next();
    }    
};

// route for user logout
app.get('/logout', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.clearCookie('user_sid');
        res.redirect('/');
    } else {
        res.redirect('/login');
    }
});


http.listen(3000, function(){
    console.log('started on port 3000');
});

var loggedin = false;
var userid;
app.get('/', function(req, res){
    res.sendFile('login.html', { root: __dirname });
});

app.post('/main', function(req, res){
    console.log(req.body.usertype,req.body.id,req.body.password);
    //these should be received from "HTML form" object
    var type = req.body.usertype;
    var result;
    if(type == "Student"){
        console.log(req.body.id);
        db.query('SELECT * FROM student s WHERE s.StudentID = ?', [req.body.id], (err,rows) => {
            if(err) throw err;
            
            if(rows[0] != undefined){
                if(rows[0].password == req.body.password){
                    //res.sendFile('index.html', { root: __dirname });
                    //res.setHeader('Content-Type', 'application/json');
                    //res.send(JSON.stringify ({ userid : req.body.id}));
                    res.json({username : "walawwwwwwwwwwwww"});
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
/*
app.post('/main', function(req, res){
    console.log(req.body.usertype,req.body.id,req.body.password);
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
*/

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
    var userid = req.query.userid;
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

