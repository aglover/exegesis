# CoffeeScript - Mongoose - MongoDB dictionary app

This project is a Node web app (using [Express](http://expressjs.com/)) that leverages [MongoDB](http://www.mongodb.org/) for a datastore. 
The source code is [CoffeeScript](http://coffeescript.org/). ORM is facilitated by [Mongoose](http://mongoosejs.com/), which is a Mongoid-like 
framework (if you are coming from the Ruby community) in that it allows you to create model objects that represent documents. The API is fairly
straightforward; if you're familiar with native Mongo query semantics then you'll pick up Mongoose quickly. For more information and examples of 
Mongoose, check out the tests in the `test` directory of this project. 

## Installation

Make sure you are on a current version of Node and have CoffeeScript installed. First grab all the required dependencies via `npm install` and then 
type `coffee app/App.coffee`. 

Note, to connect to a valid instance of Mongo, you'll need a username and password; what's more, you'll need to export them so that the process can read them at runtime like so:

```
$>export MONGO_USER=...
$>export MONGO_PASSWORD=...
```

## Running the tests

This project uses [Mocha](http://mochajs.org/) and [should](https://github.com/visionmedia/should.js) -- to run these tests, type `cake test`.

Note, the tests assume you have Mongo running locally.

## Helpful resources

* [CoffeeScript Style Guide](https://github.com/polarmobile/coffeescript-style-guide)
* [mongoose](http://mongoosejs.com/)
* [Node.js Module – exports vs module.exports](http://www.hacksparrow.com/node-js-exports-vs-module-exports.html)
* [Nodejs Modules and Export Explained](http://itsallabtamil.blogspot.com/2012/01/nodejs-modules-and-export-explained.html)
* [Mastering Node](http://visionmedia.github.com/masteringnode/book.html)
* [Blog Rolling with MongoDB, Node.js and Coffeescript](http://blog.james-carr.org/2012/01/16/blog-rolling-with-mongodb-node-js-and-coffeescript/)

## Tools, libraries, and things to checkout

* [express-negotiate](https://github.com/chrisleishman/express-negotiate)
* [core express content-negotiation](https://github.com/visionmedia/express/blob/master/examples/content-negotiation/index.js)
* [core express request object](https://github.com/visionmedia/express/blob/master/lib/request.js)
* [Blog Rolling with MongoDB, Node.js and Coffeescript](http://blog.james-carr.org/2012/01/16/blog-rolling-with-mongodb-node-js-and-coffeescript/)
* [mongoose-types](https://github.com/bnoguchi/mongoose-types)
* [eco template engine](https://github.com/sstephenson/eco)
* [whiskers.js template engine](https://github.com/gsf/whiskers.js)
* [CoffeeLint](http://www.coffeelint.org/)


# License

The MIT License

Copyright (c) 2011 Andrew Glover

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to 
deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
OTHER DEALINGS IN THE SOFTWARE
