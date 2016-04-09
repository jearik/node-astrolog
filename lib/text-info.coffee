learning = {}
meaningFound = null
currentTopicName = null

_ = require 'underscore'

{Switches, warn, error} = Astrolog = (require './astrolog')()

module.exports = (runner) ->
  meaningFound or= new Promise (resolve, reject) ->
    switches = new Switches help: 'meanings'

    runner switches.args
      .on 'data', (line) ->
        addMeaning line.toString()

      .on 'end', ->
        for name, value of meaning
          meaning[name] = learning[name]

        resolve meaning

      .on 'error', (args...) -> reject args...
  
class Subject
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
      match: /^(.*) represents? one's (.*).$/
      transform: ([all, name, meaning]) -> {name, meaning}
  aspect:
    new Subject
      header: /^Aspects/
      match: /^When planets are ([^ ]*), (one .*)$/
      transform: ([all, name, meaning]) -> {name, meaning}

addMeaning = (line) ->
  if (not detectTopicChange line)
    if not currentTopicName
      warn "no topic yet", line
      return

    topic = meaning[currentTopicName]

    if matched = line.match topic.match
      info = topic.transform matched
      learning[currentTopicName][info.name] = info.meaning
    else
      throw new Error "No match for input: #{line}"

detectTopicChange = (line) ->
  for topicName, topic of meaning
    if matchResult = topic.headingMatch line
      currentTopicName = topicName
      return learning[topicName] or= {name: topicName}

  return

