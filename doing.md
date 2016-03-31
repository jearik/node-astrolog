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

## Planned

  - Review existing tests
  - Refactor tests per above
