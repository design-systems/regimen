module.exports = (chai, utils) ->
  aMethod = (_super) -> (property) ->
    switch property
      when "title", "subtitle", "description"
        block = @_obj
        utils.flag @, "block.property", { block, property }

        @assert(
          block[property]?
          "expected block #{block.id} to have a #{property}"
          "expected block #{block.id} to not have a #{property}"
        )
      else
        _super.apply @, arguments

  aProperty = (_super) -> ->
    utils.flag @, "block.property", true
    _super.apply @, arguments

  chai.Assertion.overwriteChainableMethod "a", aMethod, aProperty


  ### Equal ###
  # equal / equals / eq
  # deep.equal / eql / eqls

  overwriteForEquality = (preposition, assertion) ->
    (_super) -> (value) ->
      {block, property} = utils.flag @, "block.property"

      if property?
        @assert(
          assertion block[property], value
          "expected block #{block.id} to have a #{property} #{preposition} \#{exp} but got \#{act}"
          "expected block #{block.id} to not have a #{property} #{preposition} \#{exp} but got \#{act}"
          value
          property
        )
      else
        _super.apply @, arguments

  overwriteMethodForEquality = (name, preposition, assertion) ->
    method = overwriteForEquality preposition, assertion
    chai.Assertion.overwriteMethod name, method

  overwriteEqualMethod = (name) ->
    overwriteMethodForEquality name, "to equal", (property, value) ->
      property is value

  overwriteDeepEqualMethod = (name) ->
    overwriteMethodForEquality name, "to deep equal", (property, value) ->
      JSON.stringify(property) is JSON.stringify(value)

  overwriteEqualMethod "equal"
  overwriteEqualMethod "equals"
  overwriteEqualMethod "eq"

  overwriteDeepEqualMethod "eql"
  overwriteDeepEqualMethod "eqls"


  ### Length ###

  overwriteForLength = (preposition, assertion) ->
    (_super) -> (number) ->
      {block, property} = utils.flag @, "block.property"

      if property?.length?
        @assert(
          assertion property.length, number
          "expected block #{block.id} to have a #{property} with length #{preposition} \#{exp} but length was \#{act}"
          "expected block #{block.id} to not have a #{property} with length #{preposition} \#{exp} but length was \#{act}"
          number
          property.length
        )
      else
        _super.apply @, arguments


  overwriteChainableMethodForLength = (name, preposition, assertion) ->
    method = overwriteForLength preposition, assertion

    property = (_super) -> ->
      _super.apply @, arguments

    chai.Assertion.overwriteChainableMethod "length", method, property


  overwriteMethodForLength = (name, preposition, assertion) ->
    method = overwriteForLength preposition, assertion
    chai.Assertion.overwriteMethod name, method



  overwriteChainableMethodForLength "length", "of", (length, number) ->
    length is number


  overwriteLeastMethod = (name) ->
    overwriteMethodForLength name, "at least", (length, number) ->
      length >= number

  overwriteLeastMethod "least"
  overwriteLeastMethod "gte"


  overwriteMostMethod = (name) ->
    overwriteMethodForLength name, "at most", (length, number) ->
      length <= number

  overwriteMostMethod "most"
  overwriteMostMethod "lte"


  overwriteAboveMethod = (name) ->
    overwriteMethodForLength name, "above", (length, number) ->
      length > number

  overwriteAboveMethod "above"
  overwriteAboveMethod "gt"
  overwriteAboveMethod "greaterThan"


  overwriteBelowMethod = (name) ->
    overwriteMethodForLength name, "below", (length, number) ->
      length < number

  overwriteBelowMethod "below"
  overwriteBelowMethod "lt"
  overwriteBelowMethod "lessThan"
