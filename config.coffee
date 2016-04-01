path = require 'path'
_ = require 'underscore'

module.exports = config =
  basedir: root = path.dirname module.filename

_.extend config,
  bin:
    astrolog: path.join root, 'bin', 'astrolog'
  dir:
    ephemeris: path.resolve path.join root, 'data'
