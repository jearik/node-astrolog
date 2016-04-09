# EVENTUALLY this will export ways of invoking the astrolog binary and
# capturing its output. At a minimum the ways will include "for text" and "for
# image" output.

# The environment variable ASTROLOG can be used to specify the directory the
# binary searches for config and ephemeris files.

child_process = require 'child_process'
byline = require 'byline'
_ = require 'underscore'
{Subject} = (require '..').models

module.exports = runnerFactory = ({config}) ->
  Switches = require './switches'
  getInfo = require './text-info'

  return runner =
    text: (args...) ->
      console.log "runner.text", args
      child = child_process.spawn config.bin.astrolog, args...
      child.on 'error', (args...) -> child.stdout.emit 'error', args...
      byline child.stdout
      
    image: ->

    # extract information strings from binary
    info: -> getInfo runner.text

    now: -> runner.event Switches.now()

    colSplit: colSplit = (str, columnInfo...) ->
      cols = {}

      while str.length and columnInfo.length
        [width, name, rest...] = columnInfo

        if 'string' is typeof width
          cols[width] = str
          return cols

        if 'string' is typeof name
          cols[name] = str.substr 0, width
          columnInfo = rest
        else
          columnInfo = [name, rest...]

        str = str.substr width

      return cols

    event: (switches) ->
      # XXX BAD CODE SMELL: reproducing text-info somewhat,
      # need to refactor output interpretation.
      new Promise (resolve, reject) ->
        report = bodies: {}

        runner.text switches.args
          .on 'data', (line) ->
            line = line.toString 'utf8'

            # TODO: move Astrolog output format info to config file(s)
            {   bodyAbbr, bodyAngle, retrograde, lat, latTick,
                rule, house, hrule, vel, cuspsAndTable} = columns =
              colSplit line,
                4, 'bodyAbbr', 2,
                7, 'bodyAngle', 1, 1, 'isRetro', 1, 6, 'lat', 1, 'latTick',
                2, 1, 'rulership', 3, 2, 'house', 11, 'hrule', 1, 6, 'vel',
                'cuspsAndTable'
                # Sun : 19Ari31   - 0:00' (X) [ 8th house] [-] +0.983  -  House cusp  1:  5Vir26
            report.bodies[bodyAbbr] = columns

            console.log 'added body', bodyAbbr

          .on 'end', ->
            console.log 'resolving', report
            resolve report

          .on 'error', (args...) ->
            console.log 'rejecting', args...
            reject args...
