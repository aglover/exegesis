mongoose = require 'mongoose'

Definition = mongoose.model 'definition', new mongoose.Schema({
  part_of_speech : { type: String, required: true, trim: true, enum: ['adjective', 'noun', 'verb', 'adverb'] },
  definition : {type: String, required: true, trim: true},
  example_sentence: {type: String, trim: true, required: false}
})

Word = mongoose.model 'word', new mongoose.Schema({
  spelling : {type: String, required: true, trim: true, toLowerCase: true, unique: true},
  definitions : [Definition.schema],
  synonyms : [{ type: String, trim: true, lowercase: true }]
})


exports.Definition = Definition
exports.Word = Word
