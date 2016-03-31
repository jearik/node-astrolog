assert = require 'assert'
moment = require 'moment'

app = Subject = null

module.exports =
  'this app':
    'should exist': ->
      app = require '..'
      assert app

    'should have a Suject model': ->
      {Subject} = app.models
      assert Subject


