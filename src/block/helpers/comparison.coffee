module.exports = (chai, utils) ->

  _overwriteMethod = (preposition) ->
    (_super) -> (expected) ->
      block = @_obj
      path = utils.flag @, "block.pathValue"
      target = utils.getPathValue path, block

      if target?
        negated = utils.flag @, "negate"
        utils.flag @, "object", target
        actual = target.length

        try
          _super.apply @, arguments
          result = true
        catch e
          result = false

        @assert(
          if negated then not result else result
          "expected block #{block.id} to have a #{path} with length #{preposition} \#{exp} but length was \#{act}"
          "expected block #{block.id} to not have a #{path} with length #{preposition} \#{exp} but length was \#{act}"
          expected
          actual
        )
      else
        _super.apply @, arguments


  overwriteMethod = (name, preposition) ->
    method = _overwriteMethod preposition
    chai.Assertion.overwriteMethod name, method

  overwriteChainableMethod = (name, preposition) ->
    method = _overwriteMethod preposition

    property = (_super) ->
      _super

    chai.Assertion.overwriteChainableMethod name, method, property


  overwriteLeastMethod = (name) ->
    overwriteMethod name, "at least"

  overwriteMostMethod = (name) ->
    overwriteMethod name, "at most"

  overwriteAboveMethod = (name) ->
    overwriteMethod name, "above"

  overwriteBelowMethod = (name) ->
    overwriteMethod name, "below"


  overwriteLeastMethod "least"
  overwriteLeastMethod "gte"

  overwriteMostMethod "most"
  overwriteMostMethod "lte"

  overwriteAboveMethod "above"
  overwriteAboveMethod "gt"
  overwriteAboveMethod "greaterThan"

  overwriteBelowMethod "below"
  overwriteBelowMethod "lt"
  overwriteBelowMethod "lessThan"
