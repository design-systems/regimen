module.exports = (block, expected) ->
  actual = block?.type

  @assert(
    require("flowerflip/lib/schema").isSubtypeOf actual, expected
    "expected block #{block.id} to be a subtype of \#{exp} but got \#{act}"
    "expected block #{block.id} to not be a subtype of \#{exp}"
    expected
    actual
  )
