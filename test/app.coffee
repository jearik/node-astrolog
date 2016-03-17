assert = require 'assert'
moment = require 'moment'

app = Subject = null

describe 'these tests', ->
  it 'should not be broken', ->
    assert true

describe 'this app', ->
  it 'should exist', ->
    app = require '..'
    assert app

  it 'should have a Suject model', ->
    {Subject} = app.models
    assert Subject


