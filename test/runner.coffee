assert = require 'assert'
moment = require 'moment'
config = require '../config'
{LineStream} = byline = require 'byline'

runner = null

module.exports =
  'Astrolog.runner':
    'should exist': ->
      Astrolog = (require '../lib/astrolog') config
      {runner} = Astrolog
      assert runner

    'should have text mode': ->
      assert 'function' is typeof runner.text

  'Astrolog.runner.text':
    'should be able to run Astrolog 6.10 at all': (done) ->
        lines = []
        stdout = runner.text [ "-Hc" ]
        assert stdout instanceof LineStream

        stdout
          .on 'data', (line) -> lines.push line
          .on 'end', ->
            assert lines.length > 0
            done()
          .on 'error', ->
            done new Error 'something went wrong: ' + JSON.stringify arguments, 0, 2

  'Astrolog.runner.info':
    'should extract interpretation strings': (done) ->
      runner.info()
        .then (interp) ->
          assert.equal typeof interp, 'object'
          assert.equal typeof interp.sign, 'object'
          assert interp.sign.Pisces
          done()
        .catch done
