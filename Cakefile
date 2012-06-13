{exec} = require 'child_process'

# task 'build', 'Build project from src/*.coffee to root/*.js', ->
#   exec 'coffee --compile --output ./ src/', (err, stdout, stderr) ->
#     throw err if err
#     console.log stdout + stderr

# task 'build_tests', 'Build project from test/*.coffee to test/js/*.js', ->
#   exec 'coffee --compile --output test/js test/', (err, stdout, stderr) ->
#     throw err if err
#     console.log stdout + stderr

task 'test', ->
	# invoke 'build_tests'
	exec './node_modules/mocha/bin/mocha --compilers coffee:coffee-script -c -t 10000 -R spec', (stderr, stdout) ->
		console.log stdout
		console.log stderr if stderr