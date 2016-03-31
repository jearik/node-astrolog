assert = require 'assert'
moment = require 'moment'

app = Subject = null

module.exports =
  'these tests':
    'should not be broken': ->
      assert true

  'this app':
    'should exist': ->
      app = require '..'
      assert app

    'should have a Suject model': ->
      {Subject} = app.models
      assert Subject


