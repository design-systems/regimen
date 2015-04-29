module.exports = (chai, utils) ->

  _overwriteMethod = (preposition, assertion) ->
    (_super) -> (propertyName) ->
      switch propertyName
        when "cover", "description", "html", "subtitle", "title"
          block = @_obj
          utils.flag @, "block.propertyName", { block, propertyName }
          property = block[propertyName]

          @assert(
            assertion property
            "expected block #{block.id} to have a #{propertyName}"
            "expected block #{block.id} to not have a #{propertyName}"
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


  overwriteAnMethod = (name) ->
    overwriteChainableMethod name, "a", (property) ->
      property?


  overwriteAnMethod "a"
  overwriteAnMethod "an"
