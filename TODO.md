# TODO:

* Accept strings for item types
  - `expect(item).to.be.a("repost").with.a("title")`

* Update build pipeline. Add Phantom.

* Consolidate existence specs for custom properties.

* Add and update specs with:

  - does
    - used like "does not"
  - doesnt
    - alias for "not"
  - without
    - alias for "not with"
  - containing
    - alias for "contains"
  - only
    - for whitelisting properties
    - `expect(block).to.only.have.a("title").and.a("description")`
