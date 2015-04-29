module.exports = (block, expectedType) ->
  actualType = block?.type
  id = block?.id

  @assert(
    require("flowerflip/lib/schema").isSubtypeOf actualType, expectedType
    "expected block #{id} to be a subtype of \#{exp} but got \#{act}"
    "expected block #{id} to not be a subtype of \#{exp}"
    expectedType
    actualType
  )
