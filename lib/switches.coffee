_ = require 'underscore'

zeropad = (w, n) -> (Number(n) + 10**w).toString().substr 1


class Switch
  constructor: (@flag, @format = [], @params = {}, @defaults = {}) ->
    @formatCompiled = @format.map (f) -> _.template f
    for name, translator of @params
      if 'function' isnt typeof translator
        throw new Error 'Switch constructor called with non-function translator'
  
  toArgs: (info = {}) ->
    args = ["-#{@flag}"]

    for name, translator of @params
      info[name] = translator info[name], info

    info = _.extend {}, @defaults, info, @params

    for format in @formatCompiled
      args.push format info

    args

  toString: -> @toArgs.join ' '

  withOverrides: (overrides) ->
    new Switch @flag, @format, @params, _.extend {}, @defaults, overrides

numericSwitch = (flag, name, defValue) ->
  defaults = {}
  defaults[name] = defValue

  new Switch flag, [ "<%=#{name}%>" ], {}, defaults


# XXX: bad code smell - need better name, better way to manage this
switches =
  help:
    generic: 'H'
    credits: 'Hc'
    signs: 'HC'
    houses: 'HC'
    planets: 'HO'
    aspects: 'HA'
    constelations: 'HF'
    planetDetails: 'HS'
    rays: 'H7'
    meanings: 'HI'

  screenWidth: numericSwitch "I", 'width', 200

  linesPerPage: numericSwitch "YQ", 'lines', 0

  subject: new Switch "qa", [
      "<%=year%>", "<%=month%>", "<%=day%>",
      "<%=time%>", "<%=tz%>",
      "<%=long%>", "<%=lat%>",
    ], {
      year:  (y = 1974) -> zeropad 4, y
      month: (m = 3)    -> zeropad 2, m
      day:   (d = 16)   -> zeropad 2, d
      time:  (given = "02:50PM", info) ->
        if given
          return given

        {hour, minute, ampm} = info
        hour = Number(hour)
        minute = Number(minute)

        if not ampm or hour > 12
          if hour < 12
            ampm = 'AM'
            hour = 12 if hour is 0
          else
            hour -= 12
            ampm = 'PM'

        hour = zeropad 2, hour
        minute = zeropad 2, minute

        return "#{hour}:#{minute}#{ampm}"
      tz: (given = "PST") -> given
      long: (given = "123.45W") -> given
      lat: (given = "45N") -> given
    }
 
for kind in Object.keys switches.help
  switches.help[kind] = new Switch switches.help[kind]


module.exports =
  class Switches
    constructor: (opts = {}) ->
      {subject, help, @args = []} = opts
      @needed = []
   
      if help
        @need switches.help[help], @maxScreenWidth(), @noPageBreaks(),

      if subject
        @need @subject subject

    maxScreenWidth: -> switches.screenWidth

    noPageBreaks: -> switches.linesPerPage

    subject: (subject) ->
      switches.subject.withOverrides subject
      
    need: (picked...) ->
      @needed = @needed.concat picked

      for pick in picked
        @args = @args.concat pick.toArgs()
          
    toString: ->
      @args.join ' '

