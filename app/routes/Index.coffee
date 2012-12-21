mongoose = require 'mongoose'
models = require '../models/Models'

module.exports = 
	# '/'
	post: (req, res) ->
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
				
	get: (req, res) ->
		res.render 'index'
		
	new_word: (req, res) ->
		console.log(JSON.stringify(req.body))
		word = new models.Word({spelling : req.body.spelling.toLowerCase()})
		word.definitions.push {definition: req.body.definition_1, part_of_speech: req.body.part_of_speech, example_sentence: req.body.ex_sentence_1}
		word.save (err, data) ->
			if err
				console.log "error is #{err}"
			else
				res.render 'index'