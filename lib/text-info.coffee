learning = {}
meaningFound = null
currentTopic = null

_ = require 'underscore'

{Switches} = Astrolog = (require './astrolog')()

module.exports = (runner) ->
  meaningFound or= new Promise (resolve, reject) ->
    switches = new Switches help: 'meanings'
    runner switches.args
      .on 'data', (line) -> addMeaning line.toString()
      .on 'end', ->
        for name, value of meaning
          currentTopic[name] = value.learned

        resolve meaning
      .on 'error', (args...) -> reject args...
  
subject = class Subject
  constructor: (info) ->
    @learned = {}
    _.extend this, info

  headingMatch: (line) -> line.match @header

  infoMatch: (line) ->
    if matched = line.match @match
      {name, value} = @transform matched
      @learned[name] = value

meaning =
  sign:
    new Subject
      header: /^Signs/
      match: /^([^ ]*) is (.*).$/
      transform: ([all, name, meaning]) -> {name, meaning}
  house:
    new Subject
      header: /^Houses/
      match: /^The (.*) House is the area of life dealing with (.*).$/
      transform: ([all, name, meaning]) -> {name, meaning}
  planet:
    new Subject
      header: /^Planets/
      match: /^(.*) represents one's (.*).$/
      transform: ([all, name, meaning]) -> {name, meaning}
  aspect:
    new Subject
      header: /^Aspects/
      match: /^When planets are ([^ ]*), (one .*)$/
      transform: ([all, name, meaning]) -> {name, meaning}

addMeaning = (line) ->
  # XXX: Bad code smell - too clever, too Perl-esq
  [matchFound] =
    (Object.keys meaning)
      .map (name) -> [name, meaning[name].headingMatch line]
      .filter ([name, headingMatch]) -> headingMatch
      .map ([name, headingMatch]) -> name

  if matchFound
    return currentTopic = learning[matchFound] or= {name: matchFound}

  subject = meaning[currentTopic.name]

  if matched = line.match subject.match
    _.extend currentTopic, subject.transform matched
  else
    throw new Error "No match for input: #{line}"


