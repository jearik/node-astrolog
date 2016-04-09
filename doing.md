# Todo

# Design

## Justification

The Astrolog program is a lot of fun to use, but the user interfaces are
awkward. The program can compare charts, progressed charts, transits and can
assemble computer interpretations for much of what it calculates, but finding
the right incantation of command line switches is a hassle. The tool also
provides both text and graphic output but does not combine them gracefully.

This program maps the command line switches to familiar web interfaces such as
form fields, jQuery-UI widgets and the like. It stores both the user's input
and the Astrolog program's output so that the user can (for example) look for
all of the events they have entered which had a particular body/sign
combination.
