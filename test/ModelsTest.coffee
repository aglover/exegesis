require 'should'
require 'mocha'
mongoose = require 'mongoose'
models = require '../app/models/Models'

describe 'models', ->
	beforeEach ->
		mongoose.connect 'mongodb://localhost/words_test'
		
	describe 'creating words', ->
		before ->
			models.Word.remove spelling:'nefarious', (err, data) ->

		it 'save() should create a new word', (done) ->
			word = new models.Word({spelling : 'nefarious'})
			word.synonyms.push 'evil'
			word.synonyms.push 'menacing'
			word.definitions.push { definition : 'extremely wicked or villainous; iniquitous.', part_of_speech: 'adjective' }
			word.save (err, data) ->
				models.Word.findById word._id, (err, document) ->
					document.spelling.should.eql 'nefarious'
					document.definitions.length.should.eql 1
					document.synonyms.length.should.eql 2
					document.definitions[0]['part_of_speech'].should.eql 'adjective'
					models.Word.remove _id: word._id, (err, data) ->
						done(err)

	describe 'finding words', ->
		before ->
			word = new models.Word({spelling : 'nefarious'})
			word.synonyms.push 'evil'
			word.synonyms.push 'menacing'
			word.definitions.push {definition : 'extremely wicked or villainous; iniquitous.', part_of_speech: 'adjective' }
			word.save (err, data) ->
				
		it 'findOne should return one', (done) ->
			models.Word.findOne spelling:'nefarious', (err, document) ->
				document.spelling.should.eql 'nefarious'
				document.definitions.length.should.eql 1
				document.synonyms.length.should.eql 2
				document.definitions[0]['part_of_speech'].should.eql 'adjective'
				done(err)
				
		it 'find should return and array with one doc', (done) ->
			models.Word.find spelling:'nefarious', (err, documents) ->
				documents[0].spelling.should.eql 'nefarious'
				documents[0].definitions.length.should.eql 1
				documents[0].synonyms.length.should.eql 2
				documents[0].definitions[0]['part_of_speech'].should.eql 'adjective'
				done(err)
				
		it 'finding by definition should return the entire word doc', (done) ->
			models.Word.find 'definitions.definition': 'extremely wicked or villainous; iniquitous.', (err, documents) ->
				documents[0].spelling.should.eql 'nefarious'
				documents[0].definitions.length.should.eql 1
				documents[0].synonyms.length.should.eql 2
				documents[0].definitions[0]['part_of_speech'].should.eql 'adjective'
				done(err)
		
		after ->
			models.Word.remove spelling:'nefarious', (err, data) ->
				

	describe 'updating words', ->
		before ->
			word = new models.Word({spelling : 'loquacious'})
			word.synonyms.push 'verbose'
			word.definitions.push {definition: 'talking or tending to talk much or freely; talkative; chattering; babbling; garrulous.', part_of_speech: 'adjective' }
			word.save (err, data) ->
		
		it 'update should be able to add another another definition', (done) ->
			newDefinition = {definition: 'characterized by excessive talk; wordy: easily the most loquacious play of the season', part_of_speech: 'adjective'}
			models.Word.update {spelling: 'loquacious'}, {$push: {definitions: newDefinition}}, {multi: false}, (err, num) ->
				num.should.eql 1
				models.Word.findOne spelling:'loquacious', (err, document) ->
					document.definitions.length.should.eql 2
					done(err)
		
		after ->
			models.Word.remove spelling:'loquacious', (err, data) ->
				
			
			
