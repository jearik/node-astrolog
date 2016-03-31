# node-astrolog

NodeJS front-end to astrolog app found at astrolog.org.

# Project Status

## _PATHETIC_

# Installation

## Astrolog

- Install dependencies

On Debian-based distributions:

    apt-get install build-essential libx11-dev unzip

- Acquire

  For the sake of automated testing from a fresh clone, this repository
  includes a copy of the following files obtained from 
  http://www.astrolog.org/astrolog/astfile.htm:

    ast61src.zip
    astephem.zip

  You should feel free to re-download them or download newer versions if such
  are available.

- Configure

  Edit build/astrolog.h for an X11 configuration. (details to come later)

- Build
  - From project root:

    mkdir -p build bin
    cd build
    unzip ../download/ast61src.zip
    make
    mv astrolog ../bin

## Rest of project

    npm install

# Usage

    node .

Now browse to http://127.0.0.1:3000 (or equivalent). Neat, huh?!

# Dependency Licenses

This tool builds on Astrolog which, according to the comment at the top of
each source file, is distriuted under the GPLv2. See said files for specifics.

The LICENSE file in this repo applies to everything except the content of the
'download' directory, which were downloaded from astrolog.org.
