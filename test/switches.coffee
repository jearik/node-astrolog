assert = require 'assert'
moment = require 'moment'

Subject = Astrolog = Switches = null

before ->
  app = require '..'

  {Subject} = app.models

module.exports =
  'Switches':
    'should exist at all': ->
      Astrolog = require '../lib/astrolog'
      {Switches} = Astrolog
      assert new Switches

    'should generate input switches for a Subject': (done) ->
      Subject.create
          name: "Robert"
          dateAndTime: moment("1974-03-16 14:50 PDT")
          longitude: 123.45
          latitude: 45
        .then (subject) ->
          switches = new Switches subject: subject
          assert.equal switches.all,
            "-qa 1974 03 16 02:50PM PST 123.45W 45N"
          done()
        .catch done


