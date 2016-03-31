assert = require 'assert'
moment = require 'moment'

runner = null

module.exports =
  'Astrolog.runner':
    'should exist': ->
      {runner} = require '../lib/astrolog'
      assert runner

    'should have text mode': ->
      assert 'function' is typeof runner.text

  'Astrolog.runner.text':
    'should be able to run Astrolog 6.00': (done) ->
      done()
