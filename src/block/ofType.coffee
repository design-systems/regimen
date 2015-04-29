module.exports = (chai, utils) ->
  chai.Assertion.addMethod "ofType", (expectedType) ->
    block = @_obj
    actualType = block?.type
    id = block?.id

    @assert(
      expectedType is actualType
      "expected block #{id} to be a of type \#{exp} but got \#{act}"
      "expected block #{id} to not be of type \#{exp}"
      expectedType
      actualType
    )
