# EVENTUALLY this will export ways of invoking the astrolog binary and
# capturing its output. At a minimum the ways will include "for text" and "for
# image" output.

# The environment variable ASTROLOG can be used to specify the directory the
# binary searches for config and ephemeris files.

byline = require 'byline'
_ = require 'underscore'

subject = class Subject
  constructor: (@info) -> @learned = {}

  headingMatch: (line) -> line.match @info.header

  infoMatch: (line) ->
    if matched = line.match @info.match
      {name, value} = @info.transform matched
      @learned[name] = value

meaningFound = null

meaning =
  subject: ''
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
      match: /^([^ ]*) represents one's (.*).$/
      transform: ([all, name, meaning]) -> {name, meaning}
  aspect:
    new Subject
      header: /^Aspects/
      match: /^When planets are ([^ ]*), (one .*)$/
      transform: ([all, name, meaning]) -> {name, meaning}

addMeaning = (line) ->
  # XXX: Bad code smell - too clever, too Perl-esq
  [subjectName, matched] =
    (Object.keys meaning)
      .map (name) -> [name, meaning[name].headingMatch line]
      .filter ([name, headingMatch]) -> headingMatch
      .reduce (a, b) -> if a[1] then a else b

  if matched
    return meaning.subject = subjectName

  subject = meaning[studying]

  if matched = line.match subject.match
    _.extend subject.learned, subject.transform matched
  else
    throw new Error "No match for input: #{line}"

module.exports = runner =
  text: ->
  image: ->

  # extract information strings from binary
  info: ->
    meaningFound or= new Promise (resolve, reject) ->
      runner.text new Switches help: 'meanings'
        .then (stream) ->
          byline(stream)
            .on 'data', (line) ->
              addMeaning line

            .on 'end', ->
              for name, value of meaning
                meaning[name] = value.learned

              resolve meaning
              
          
