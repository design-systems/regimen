module.exports = (chai, utils) ->

  _overwriteMethod = (preposition, assertion) ->
    (_super) -> (number) ->
      block = @_obj
      propertyName = utils.flag @, "block.propertyName"
      property = block[propertyName]

      if property.length?
        expected = property.length
        actual = number

        @assert(
          assertion expected, actual
          "expected block #{block.id} to have a #{propertyName} with length #{preposition} \#{exp} but length was \#{act}"
          "expected block #{block.id} to not have a #{propertyName} with length #{preposition} \#{exp} but length was \#{act}"
          expected
          actual
        )
      else
        _super.apply @, arguments


  overwriteMethod = (name, preposition, assertion) ->
    method = _overwriteMethod preposition, assertion
    chai.Assertion.overwriteMethod name, method

  overwriteChainableMethod = (name, preposition, assertion) ->
    method = _overwriteMethod preposition, assertion

    property = (_super) ->
      _super

    chai.Assertion.overwriteChainableMethod name, method, property


  overwriteLeastMethod = (name) ->
    overwriteMethod name, "at least", (length, number) ->
      length >= number

  overwriteMostMethod = (name) ->
    overwriteMethod name, "at most", (length, number) ->
      length <= number

  overwriteAboveMethod = (name) ->
    overwriteMethod name, "above", (length, number) ->
      length > number

  overwriteBelowMethod = (name) ->
    overwriteMethod name, "below", (length, number) ->
      length < number


  overwriteChainableMethod "length", "of", (length, number) ->
    length is number

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
