# EVENTUALLY this will export ways of invoking the astrolog binary and
# capturing its output. At a minimum the ways will include "for text" and "for
# image" output.

# The environment variable ASTROLOG can be used to specify the directory the
# binary searches for config and ephemeris files.

child_process = require 'child_process'
byline = require 'byline'
_ = require 'underscore'

module.exports = runnerFactory = ({config}) ->
  getInfo = require './text-info'

  return runner = {
    text: (args...) ->
      child = child_process.spawn config.bin.astrolog, args...
      child.on 'error', (args...) -> child.stdout.emit 'error', args...
      byline child.stdout
      
    image: ->

    # extract information strings from binary
    info: -> getInfo runner.text
  }

