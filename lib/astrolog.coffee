moment = require 'moment'


module.exports = Astrolog = (config) ->
  Switches: Switches = require './switches'

  EventReport: EventReport = require './event-report'

  RunnerFactory: RunnerFactory = require './runner'

  AstroParse: AstroParse = require './astro-parse'

  config: config

  runner: RunnerFactory config: config

  warn: ->
  error: (errMsg = 'generic error') -> throw new Error errMsg

  expectedVersion: '6.10'

  parseTitle: (line) ->

    [sAstrolog, sVersion, sChart, sFor,
    sWeekDay, sMonth, sDayComma, sYear,
    sParenDSTstate, sTime, sTimeZoneParen,
    sLatitude, sLongitude] = line.split "  *"

    sDayComma.replace ',',''
    sParenDSTstate.replace '(', ''
    sTimeZoneParen.replace ')', ''

    date = moment [ymd, time].join(' '), "YYYY-MM-DD hh:mma"

    if sVersion isnt @expectedVersion
      @warn "Expected Astrolog version #{@expectedVersion}, seeing #{sVersion}"

    [hour, minute] = sTime.split ':'
    postMeridiam = minute.endsWith 'pm'

    return  version:   sVersion
            date:      date
            latitude:  sLatitude
            longitude: sLongitude

  parseTextOutput: (output) ->
    lines = output.split /(\r|\r\n|\n|\n\r)/
    [title, headers, blankLine, rest...] = lines

    data = parseTitle title

