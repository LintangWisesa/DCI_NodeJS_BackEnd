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

module.exports = router


// // GET all data
// router.get('/data', (req, res) => {
//     var dbStat = 'select * from products'
//     db.query(dbStat, (error, output) => {
//         if(error){
//             console.log(error)
//         } else {
//             console.log(output)
//             res.send(output)
//         }
//     })
// })

// // GET data by id
// router.get('/data/:id', (req, res) => {
//     var dbStat = 'select * from products where id = ?'
//     db.query(dbStat, req.params.id, (error, output) => {
//         if(error){
//             console.log(error)
//         } else {
//             console.log(output)
//             res.send(output)
//         }
//     })
// })

// // POST data
// router.post('/data', (req, res)=>{
//     var dbStat = 'insert into products set ?'
//     var data = {
//         product_name: req.body.nama,
//         price: req.body.harga,
//         info: req.body.info,
//         quantity: req.body.jumlah
//     }
//     db.query(dbStat, data, (error, output) => {
//         if(error){
//             console.log(error)
//             res.send(error)
//         } else {
//             console.log(output)
//             res.send({
//                 product_name: req.body.nama,
//                 price: req.body.harga,
//                 info: req.body.info,
//                 quantity: req.body.jumlah,
//                 status: 'Data terkirim' 
//             })
//         }
//     })
// })

// // PUT edit data by id
// router.put('/data/:id', (req, res)=>{
//     var dbStat = 'update products set ? where id = ?'
//     var data = {
//         product_name: req.body.nama,
//         price: req.body.harga,
//         info: req.body.info,
//         quantity: req.body.jumlah
//     }
//     db.query(dbStat, [data, req.params.id], (error, output) => {
//         if(error){
//             console.log(error)
//             res.send(error)
//         } else {
//             console.log(output)
//             res.send({
//                 product_name: req.body.nama,
//                 price: req.body.harga,
//                 info: req.body.info,
//                 quantity: req.body.jumlah,
//                 status: 'Data terupdate' 
//             })
//         }
//     })
// })

// // DELETE data by id
// router.delete('/data/:id', (req, res)=>{
//     var dbStat = 'delete from products where id = ?'
//     db.query(dbStat, req.params.id, (error, output) => {
//         if(error){
//             console.log(error)
//         } else {
//             console.log(output)
//             res.send(output)
//         }
//     })
// })

