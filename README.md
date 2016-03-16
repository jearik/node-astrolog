# node-astrolog

NodeJS front-end to astrolog app found at astrolog.org.

# Installation

## Astrolog

- Install dependencies

On Debian-based distributions:

    apt-get install build-essential libx11-dev unzip

- Acquire
  Go to http://www.astrolog.org/astrolog/astfile.htm and download the source
  (ast60src.zip as of this writing) and the ephemeris files (astephem.zip) and
  place them in the 'downloaded' directory.

- Build
  - From project root:

    mkdir -p build/astrolog bin
    cd build/astrolog
    unzip ../../ast60src.zip
    make
    mv astrolog ../../bin

## Rest of project

    npm install

# Usage

    node .

Now browse to http://127.0.0.1:3000 (or equivalent). Neat, huh?!
