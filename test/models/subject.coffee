assert = require 'assert'
testData = require '../test-data'

app = require '../..'
{Subject} = app.models

describe 'Subject', ->
  it 'should have a constructor', (done) ->
    Subject.create testData.subject
      .then (subject) ->
        assert subject
        done()
      .catch done
