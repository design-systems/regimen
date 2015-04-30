module.exports = (chai, utils) ->

  _overwriteMethod = (preposition) ->
    (_super) -> (expected) ->
      block = @_obj
      propertyName = utils.flag @, "block.propertyName"
      property = block[propertyName]

      if property?
        negated = utils.flag @, "negate"
        actual = property
        utils.flag @, "object", actual

        try
          _super.apply @, arguments
          result = true
        catch e
          result = false

        @assert(
          if negated then not result else result
          "expected block #{block.id} to have a #{propertyName} #{preposition} \#{exp} but got \#{act}"
          "expected block #{block.id} to not have a #{propertyName} #{preposition} \#{exp} but got \#{act}"
          expected
          actual
        )
      else
        _super.apply @, arguments


  overwriteMethod = (name, preposition) ->
    method = _overwriteMethod preposition
    chai.Assertion.overwriteMethod name, method


  overwriteEqualMethod = (name) ->
    overwriteMethod name, "equal to"

  overwriteDeepEqualMethod = (name) ->
    overwriteMethod name, "deeply equal to"


  overwriteEqualMethod "equal"
  overwriteEqualMethod "equals"
  overwriteEqualMethod "eq"

  overwriteDeepEqualMethod "eql"
  overwriteDeepEqualMethod "eqls"
