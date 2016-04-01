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

# Todo

# Doing Now

## Session 2016-04-01 15:30

  - Plan
    - 'able to run' test passing
  - Actual
    - Success!

# Done

## Session 2016-04-01 14:40

  - Plan
    - runner tests passing
  - Actual
    - some progress I guess
    - need to chunk my tasks smaller

## Session 2016-04-01 13:30

  - Plan
    - switches tests passing
  - Actual
    - lot of work on lib/switches
    - extending session
    - And good thing too because the switches tests are passing now

## Session 2016-04-01 12:10

  - Plan
    - text runner passing tests without cheating
  - Actual
    - util object and tests
    - added tests for Switches
    - ran well over time

## Session 2016-03-31 17:00

  - Plan
    - Chat with Ty Pethe
    - Chat with Bruce Felt
  - Actual
    - Chat with Ty Pethe
    - Chat with Bruce Felt

## Session 2016-03-31 14:00

  - Plan
    - Design
      - Describe the app more than just "wrap astrolog in StrongLoop"
  - Actual
    - Lots of work on runner
    - Wrote some tests for the Switches class and then made them pass

## Session 2016-03-31 14:00

  - Plan
    - Review existing tests
    - Refactor tests per above
  - Actual
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
