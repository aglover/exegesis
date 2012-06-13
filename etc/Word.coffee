mongoose = require 'mongoose'

# module.exports = mongoose.model 'definition', new mongoose.Schema({
#   part_of_speech : { type: String, required: true, trim: true, enum: ['adjective', 'noun', 'verb', 'adverb'] },
#   definition : {type: String, required: true, trim: true}
# })

Definition = require './Definition'

module.exports = mongoose.model 'word', new mongoose.Schema({
  spelling : {type: String, required: true, trim: true, toLowerCase: true, unique: true},
  definitions : [Definition.schema],
  synonyms : [{ type: String, trim: true, lowercase: true }]
})
