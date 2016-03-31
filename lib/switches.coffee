module.exports =
  class Switches
    all: "-qa 1974 03 16 02:50PM PST 123.45W 45N"

    constructor: (opts = {}) ->
      {subject, help} = opts
      @needed = []

      if help and help is 'meanings'
        @need @maxScreenWidth(), @noPageBreaks(), @help help
    
    need: (picked...) ->
      @needed = @needed.concat picked

    maxScreenWidth: -> "I 200"

    noPageBreaks: -> "YQ 0"

    help: (kind) ->
      (
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
      )[kind]

    toString: ->
      @needed
        .map (option) -> "-" + option.toString()
        .join ' '

