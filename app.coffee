express = require('express')
logger = require('morgan')
methodOverride = require('method-override')
routes = require('./routes')
http = require('http')
path = require('path')
util = require('util')

app = express()

app.set 'port', process.env.PORT || 3000
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'
app.use logger('dev')
app.use methodOverride()
app.use(express.static(path.join(__dirname, 'public')))

app.get('*', routes.index)

module.exports = app