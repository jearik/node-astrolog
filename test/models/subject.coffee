assert = require 'assert'
moment = require 'moment'

app = Subject = null

before ->
  app = require '..'
  {Subject} = app.models

describe 'Subject', ->
  it 'should have a constructor', (done) ->
    Subject.create
        name: "Robert"
        dateAndTime: moment("1974-03-16 14:50 PDT")
        longitude: 123.45
        latitude: 45
      .then (subject) ->
        assert subject
        done()
      .catch done


