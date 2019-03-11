var express = require('express')
var cors = require('cors')
var route_user = require('./router/user')
var route_master = require('./router/karyawan')

var app = express()
app.use(route_user)
app.use(route_master)
app.use(cors())

app.get('/', (req, res)=>{
    res.send('<h1>PT. Dela Cemara Indah</h1>')
})

app.listen(1234, ()=>{
    console.log('Server aktif di port 1234')
})