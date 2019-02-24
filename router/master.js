// table master, jabatan, dept, seksi, subseksi, level

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

// get all master karyawan data
router.get('/master', (req, res)=>{
    var dbStat = `select nip, nama, j.keterangan as jabatan, d.fulldept as department, s.keterangan as seksi, stat_peg, telp from master m, jabatan j, departments d, seksi s where j.jabat = m.jabatan and d.dept = m.dept and s.jabat = m.seksi;`
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

// get master karyawan data by NIP
router.get('/master/:nip', (req, res)=>{
    var dbStat = `select *, j.keterangan as jabatan, d.fulldept as department, s.keterangan as seksi, stat_peg, telp from master m, jabatan j, departments d, seksi s where j.jabat = m.jabatan and d.dept = m.dept and s.jabat = m.seksi and nip = ${req.params.nip}`
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

module.exports = router
