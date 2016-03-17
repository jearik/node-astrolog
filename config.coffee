path = require 'path'

module.exports =
  astrolog:
    srcUrl: "http://www.astrolog.org/ftp/ast60src.zip"
    ephemerisUrl: "http://www.astrolog.org/ftp/ephem/astephem.zip"
  dir:
    ephemeris: path.resolve path.join path.dirname module.filename, '..', 'ephemeris'
