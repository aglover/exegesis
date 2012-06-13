express = require 'express'

mongoose = require 'mongoose'
mongoose.connect "mongodb://#{process.env.MONGO_USER}:#{process.env.MONGO_PASSWORD}@flame.mongohq.com:27036/metrics"
models = require './models/Models'

app = express.createServer express.logger()
app.use express.bodyParser()

app.post '/', (req, res) ->
	word = new models.Word({spelling : req.body.spelling})
	
	synonyms = req.body.synonyms?.split(',') or []
	for synon in synonyms
		word.synonyms.push synon
	
	for value in req.body.definitions
		word.definitions.push {definition: value['definition'], part_of_speech: value['part_of_speech']}

	word.save (err, data) ->
		if err
			console.log "error is #{err}"
			res.send 'error!'
		else
			res.send 'success'

port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"