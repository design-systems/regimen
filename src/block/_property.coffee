module.exports = (chai, utils, property) ->
  chai.Assertion.addProperty property, ->
    block = @_obj

    @assert(
      block[property]?
      "expected block #{block.id} to have a '#{property}'"
      "expected block #{block.id} to not have a '#{property}'"
    )

  # assertProperty = (property) ->
  #   block = @_obj
  #
  #   @assert(
  #     block[property]?
  #     "expected block #{block.id} to have a '#{property}'"
  #     "expected block #{block.id} to not have a '#{property}'"
  #   )
  #
  # chainProperty = ->
  #   utils.flag @, "block.#{property}", true
  #
  # chai.Assertion.addChainableMethod property, assertProperty, chainProperty

  # chai.Assertion.overwriteMethod "below", (_super) ->
  #   (number) ->
  #     if utils.flag @, "block.#{property}"
  #       block = @_obj
  #
  #       @assert(
  #         block[property].length < number
  #         "expected block #{block.id} to have a #{property} below \#{exp} but got \#{act}"
  #         "expected block #{block.id} to not have a #{property} below \#{exp} but got \#{act}"
  #         number
  #         block[property]
  #       )
