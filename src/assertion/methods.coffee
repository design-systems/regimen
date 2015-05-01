module.exports = (chai, utils) ->

  addOrientationMethod = (name) ->
    chai.Assertion.addMethod name, (orientation) ->
      block = @_obj

      if block.cover?
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
