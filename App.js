(function() {
  var Definition, Word, app, express, mongoose, port;
  express = require('express');
  mongoose = require('mongoose');
  mongoose.connect('mongodb://metrics:metrics@flame.mongohq.com:27036/metrics');
  Word = new mongoose.Schema({
    word: {
      type: String,
      required: true,
      trim: true,
      toLowerCase: true
    },
    part_of_speech: {
      type: String,
      required: true,
      trim: true
    },
    definitions: [Definition]
  });
  Definition = new mongoose.Schema({
    definition: {
      type: String,
      required: true,
      trim: true
    }
  });
  app = express.createServer(express.logger());
  app.use(express.bodyParser());
  app.post('/', function(req, res) {
    var word;
    word = new Word({
      word: req.body.word,
      part_of_speech: req.body.part_of_speech
    });
    return word.save(function(err, data) {
      if (err) {
        return res.send('error!');
      } else {
        return res.send('success?!');
      }
    });
  });
  port = process.env.PORT || 3000;
  app.listen(port, function() {
    return console.log("listening on " + port);
  });
}).call(this);
