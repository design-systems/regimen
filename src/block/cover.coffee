module.exports = (chai, utils) ->

  addOrientationMethod = (name) ->
    chai.Assertion.addMethod name, (orientation) ->
      block = @_obj

      if orientation?
        expected = orientation
        actual = block.cover.orientation

        @assert(
          expected is actual
          "expected block #{block.id} to have a cover with \#{exp} orientation but got \#{act}"
          "expected block #{block.id} to have a cover without \#{exp} orientation but got \#{act}"
          expected
          actual
        )

      else
        @assert(
          block.cover.orientation?
          "expected block #{block.id} to have a cover with an orientation"
          "expected block #{block.id} to have a cover without an orientation"
        )

  addOrientationMethod "orientation"
  addOrientationMethod "oriented"


  chai.Assertion.addProperty "src", ->
    block = @_obj
    utils.flag @, "block.pathValue", "cover.src"

    @assert(
      block.cover.src?
      "expected block #{block.id} cover to have a src"
      "expected block #{block.id} cover to not have a src"
    )

  chai.Assertion.addProperty "width", ->
    block = @_obj
    utils.flag @, "block.pathValue", "cover.width"

    @assert(
      block.cover.width?
      "expected block #{block.id} cover to have a width"
      "expected block #{block.id} cover to not have a width"
    )

  chai.Assertion.addProperty "height", ->
    block = @_obj
    utils.flag @, "block.pathValue", "cover.height"

    @assert(
      block.cover.height?
      "expected block #{block.id} cover to have a height"
      "expected block #{block.id} cover to not have a height"
    )
