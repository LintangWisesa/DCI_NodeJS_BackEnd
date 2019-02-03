var router = require('express').Router()
var mysql = require('mysql')
var bodyParser = require('body-parser')
var cors = require('cors')

router.use(bodyParser.json())
router.use(cors())

var db = mysql.createConnection({
    host: 'localhost',
    user: 'lintang',
    password: '12345',
    database: 'ptdci'
})

db.connect(()=>{
    console.log('Database terhubung!')
})

// login
router.post('/login', (req, res)=>{
    var dbStat = 'select * from users where nama = ? and password = ?'
    var dataLogin = [req.body.nama, req.body.password]
    db.query(dbStat, dataLogin, (error, output) => {
        if(error){
            console.log(error)
            res.send({status: 'error'})
        } else {
            if (output[0]){
                var dataUser = output[0]
                dataUser.status = 'ok'
                console.log(dataUser)
                res.send(dataUser)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// usai login, ambil daftar submenu di Master yg diizinkan
router.post('/menu/master', (req, res)=>{
    var dbStat = `select nama, submenu, menu from users, menus, usermenu where users.id = usermenu.id_user and menus.id = usermenu.id_menu and nama = ? and menu = ? and status = ?`
    db.query(dbStat, [req.body.nama, 'Master File', 'ok'], (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var subMenu = output
                console.log(subMenu)
                res.send(subMenu)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// usai login, ambil daftar submenu di Mutasi yg diizinkan
router.post('/menu/mutasi', (req, res)=>{
    var dbStat = `select nama, submenu, menu from users, menus, usermenu where users.id = usermenu.id_user and menus.id = usermenu.id_menu and nama = ? and menu = ? and status = ?`
    db.query(dbStat, [req.body.nama, 'Mutasi', 'ok'], (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var subMenu = output
                console.log(subMenu)
                res.send(subMenu)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// usai login, ambil daftar submenu di Laporan yg diizinkan
router.post('/menu/laporan', (req, res)=>{
    var dbStat = `select nama, submenu, menu from users, menus, usermenu where users.id = usermenu.id_user and menus.id = usermenu.id_menu and nama = ? and menu = ? and status = ?`
    db.query(dbStat, [req.body.nama, 'Laporan', 'ok'], (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var subMenu = output
                console.log(subMenu)
                res.send(subMenu)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// get all submenus from user id tertentu
router.get('/menu/id/:id', (req, res)=>{
    var dbStat = `select * from usermenu, menus where usermenu.id_menu = menus.id and id_user = ?`
    db.query(dbStat, req.params.id, (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var users = output
                console.log(users)
                res.send(users)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// get all submenus
router.get('/menu', (req, res)=>{
    var dbStat = `select * from menus`
    db.query(dbStat, req.params.id, (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var users = output
                console.log(users)
                res.send(users)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// get all users
router.get('/users', (req, res)=>{
    var dbStat = `select * from users`
    db.query(dbStat, (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var users = output
                console.log(users)
                res.send(users)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// get all departments
router.get('/depts', (req, res)=>{
    var dbStat = `select * from departments`
    db.query(dbStat, (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var users = output
                console.log(users)
                res.send(users)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

// get all users with its depts
router.get('/userDept', (req, res)=>{
    var dbStat = `select users.id, nama, password, users.dept, fulldept, dibuat, diupdate from users, departments where users.dept = departments.dept order by users.id`
    db.query(dbStat, (error, output) => {
        if(error){
            console.log(error)
            res.send(error)
        } else {
            if (output){
                var users = output
                console.log(users)
                res.send(users)
            } else {
                res.send({status: 'error'})
            }
        }
    })
})

module.exports = router
