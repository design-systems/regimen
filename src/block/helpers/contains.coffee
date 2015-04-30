module.exports = (chai, utils, keyName) ->

  _overwriteMethod = (preposition) ->
    (_super) -> (expected) ->
      block = @_obj
      propertyName = utils.flag @, "block.propertyName"
      property = block[propertyName]

      if property?
        actual = property[keyName]
        utils.flag @, "object", actual

        negated = utils.flag @, "negate"

        try
          _super.apply @, arguments
          result = true
        catch e
          result = false

        @assert(
          if negated then not result else result
          "expected block #{block.id} to have a #{propertyName} #{keyName} #{preposition} \#{exp} but got \#{act}"
          "expected block #{block.id} to not have a #{propertyName} #{keyName} #{preposition} \#{exp} but got \#{act}"
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


  overwriteContainsMethod = (name) ->
    overwriteChainableMethod name, "that contains"


  overwriteContainsMethod "include"
  overwriteContainsMethod "includes"
  overwriteContainsMethod "contain"
  overwriteContainsMethod "contains"
