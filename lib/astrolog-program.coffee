child_process = require 'child_process'
singleton = null

class AstrologProgram
  constructor: (@config = require '../config') ->
    if singleton
      return singleton

    singleton = this

  # Run the program, return a child_process
  fork: (switches) ->
    child = child_process.spawn config.bin.astrolog, switches.args()

  # Run program, return LineStream
  forkText: (switches) ->
    child = @fork switches
    child.on 'error', (args...) -> child.stdout.emit 'error', args...
    byline child.stdout

  forkImage: (switches) ->
    fifo = @tmpFifo()
    switches.need switches.imageOutput file: fifo
