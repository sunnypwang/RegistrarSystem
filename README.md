# RegistrarSystem
## Back end
1. Install node.js.
2. Open cmd.
3. run `node --version` to verify you have installed successfully.

4. go to project folder
```
cd <path to project folder>/RegistrarSystem
```
5. run to install necessary package
```
npm install
```
6. Start your mySQL database, you need to start it first in order for server to be able to run.
7. Import UniversityDump.sql as database name `registrar`.
8. in `db.js`, please enter mySQL credential information you used.
 ```
 host: 'localhost',    //set your mySQL hostname
 user: '',         //set your mySQL username
 password: '',     //set your mySQL password
 database: 'registrar'   //set your database name in your local computer
 ```
9. To start the server, run
```
node index.js
```
10. Using your browser, go to http://localhost:3000/. You should see the login page.
11. To stop the server, simply press ctrl+C

note: If the server couldn't be started due to missing packages, try to install them manually.
```
npm install <package-name>
```
The required packages are `express` and `mysql`
