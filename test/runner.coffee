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
    'should be able to run Astrolog 6.10 at all': (done) ->
      done()

  'Astrolog.runner.info':
    'should extract interpretation strings': (done) ->
      runner.info()
        .then (interp) ->
          assert.equal typeof interp, 'object'
          assert.equal typeof interp.sign, 'object'
          assert interp.sign.Pisces
          done()
        .catch done
