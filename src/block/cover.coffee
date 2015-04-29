equality = require "./helpers/equality"
existence = require "./helpers/existence"

module.exports = (chai, utils) ->
  property = "cover"
  equality.call @, chai, utils, property
  existence.call @, chai, utils, property


  chai.Assertion.addProperty "orientation", ->
    block = @_obj
    {cover} = block

    @assert(
      cover.orientation?
      "expected block #{block.id} to have a cover with an orientation"
      "expected block #{block.id} to have a cover without an orientation"
    )
