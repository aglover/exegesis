mongoose = require 'mongoose'

module.exports = mongoose.model 'definition', new mongoose.Schema({
  part_of_speech : { type: String, required: true, trim: true, enum: ['adjective', 'noun', 'verb', 'adverb'] },
  definition : {type: String, required: true, trim: true}
})