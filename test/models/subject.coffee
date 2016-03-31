assert = require 'assert'
testData = require '../../testData'

app = require '../..'
{Subject} = app.models

module.exports =
  Subject:
    "should have a constructor": (done) ->
      Subject.create testData.subject
        .then (subject) ->
          assert subject
          done()
        .catch done
