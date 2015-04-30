module.exports = (chai, utils) ->

  _overwriteMethod = (preposition, assertion) ->
    (_super) -> (value) ->
      block = @_obj
      propertyName = utils.flag @, "block.propertyName"
      property = block[propertyName]
      deep = utils.flag @, "deep"

      if property?
        if deep
          actual = JSON.stringify property
          expected = JSON.stringify value
        else
          actual = property
          expected = value

        @assert(
          assertion actual, expected
          "expected block #{block.id} to have a #{property} #{preposition} \#{exp} but got \#{act}"
          "expected block #{block.id} to not have a #{property} #{preposition} \#{exp} but got \#{act}"
          actual
          expected
        )
      else
        _super.apply @, arguments


  overwriteMethod = (name, preposition, assertion) ->
    method = _overwriteMethod preposition, assertion
    chai.Assertion.overwriteMethod name, method


  overwriteEqualMethod = (name) ->
    overwriteMethod name, "equal to", (property, value) ->
      property is value

  overwriteDeepEqualMethod = (name) ->
    overwriteMethod name, "deeply equal to", (property, value) ->
      JSON.stringify(property) is JSON.stringify(value)


  overwriteEqualMethod "equal"
  overwriteEqualMethod "equals"
  overwriteEqualMethod "eq"

  overwriteDeepEqualMethod "eql"
  overwriteDeepEqualMethod "eqls"
