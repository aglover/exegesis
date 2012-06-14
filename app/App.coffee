express = require 'express'

mongoose = require 'mongoose'
mongoose.connect "mongodb://#{process.env.MONGO_USER}:#{process.env.MONGO_PASSWORD}@flame.mongohq.com:27036/metrics"
models = require './models/Models'
routes = require './routes/Index'

app = express.createServer express.logger()
app.use express.bodyParser()

app.post '/', routes.index

port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"