express = require 'express'
pipeline = require 'connect-assets'

mongoose = require 'mongoose'
mongoose.connect "mongodb://#{process.env.MONGO_USER}:#{process.env.MONGO_PASSWORD}@flame.mongohq.com:27036/metrics"
# mongoose.connectSet('mongodb://localhost:9991/words,mongodb://localhost:9992/words,mongodb://localhost:9993/words')
models = require './app/models/Models'
routes = require './app/routes/Index'

app = express express.logger() 
app.use express.bodyParser()
app.use pipeline()

app.set 'view engine', 'jade'
app.use '/img', express.static(__dirname + '/public/img')
app.use '/js', express.static(__dirname + '/public/js')
app.use '/css', express.static(__dirname + '/public/css')

app.post '/', routes.post
app.get '/', routes.get

port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"