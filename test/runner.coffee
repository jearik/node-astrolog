assert = require 'assert'
moment = require 'moment'

runner = null

describe 'Astrolog.runner', ->
  it 'should exist', ->
    {runner} = require '../lib/astrolog'
    assert runner

  it 'should have text mode', ->
    assert 'function' is typeof runner.text

describe 'Astrolog.runner.text', ->
  it 'should be able to run Astrolog 6.00', (done) ->
    done()
