contains = require "./helpers/contains"
equality = require "./helpers/equality"
existence = require "./helpers/existence"

module.exports = (chai, utils) ->
  contains.call @, chai, utils, "src"
  equality.call @, chai, utils
  existence.call @, chai, utils


  addOrientationMethod = (name) ->
    chai.Assertion.addMethod name, (orientation) ->
      block = @_obj
      cover = utils.flag @, "block.cover"

      if orientation?
        expected = orientation
        actual = cover?.orientation

        @assert(
          expected is actual
          "expected block #{block.id} to have a cover with \#{exp} orientation but got \#{act}"
          "expected block #{block.id} to have a cover without \#{exp} orientation but got \#{act}"
          expected
          actual
        )

      else
        @assert(
          cover.orientation?
          "expected block #{block.id} to have a cover with an orientation"
          "expected block #{block.id} to have a cover without an orientation"
        )

  addOrientationMethod "orientation"
  addOrientationMethod "oriented"


  chai.Assertion.addProperty "src", ->
    block = @_obj
    cover = utils.flag @, "block.cover"

    @assert(
      cover.src?
      "expected block #{block.id} cover to have a src"
      "expected block #{block.id} cover to not have a src"
    )
