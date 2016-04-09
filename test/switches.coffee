assert = require 'assert'
moment = require 'moment'

testData = require '../testData'
{listInList} = require '../lib/util'

Subject = Astrolog = Switches = null
{Subject} = (app = require '..').models

module.exports =
  'Switches':
    'should exist at all': ->
      Astrolog = (require '../lib/astrolog')()
      {Switches} = Astrolog
      assert new Switches

    'should generate input switches for':
      'a Subject': (done) ->

        Subject.create testData.subject
          .then (subject) ->
            switches = new Switches subject: subject
            args = switches.args
            assert -1 < listInList args, "-qa 1974 03 16 02:50PM PST 123.45W 45N".split ' '
            done()
          .catch done

      'extracting interpretation strings': ->
        switches = new Switches help: 'meanings'
        args = switches.args
        assert "-HI" in args

        assert -1 < listInList args, ["-YQ", "0"]
        assert -1 < listInList args, ["-I", "200"]

      'now': ->
        switches = Switches.now()
        args = switches.args
        assert "-n" in args
