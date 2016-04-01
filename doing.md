# Overall

Trying to fix my shit?

  - tests should be simpler than methods (methods should be dead simple)
    - test data in its own file(s)
    - isolate test persistence
    - move test complexity to library if it's safe to do so

  - each class MUST do only ONE thing
    - aggregate (relate) other objects
    - translate between incompatible interfaces
    - transform data (map/reduce)
    - etc

# Now

## Session 2016-03-31 14:00

### Planned

  - Chat with Ty Pethe
  - Chat with Bruce Felt

### Actual

  - Chat with Ty Pethe

# Todo

# Done

## Session 2016-03-31 14:00

### Planned

  - Design
    - Describe the app more than just "wrap astrolog in StrongLoop"

### Actual

  - Lots of work on runner
  - Wrote some tests for the Switches class and then made them pass

## Session 2016-03-31 14:00

### Planned

  - Review existing tests
  - Refactor tests per above

### Actual

  - Polished tests a little
  - Moved test data to its own directory
  - Unrelated stuff

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
