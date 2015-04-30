module.exports = (chai, utils) ->

  _overwriteMethod = (preposition) ->
    (_super) -> (propertyName) ->
      switch propertyName
        when "cover", "description", "html", "subtitle", "title"
          block = @_obj
          property = block[propertyName]
          utils.flag @, "block.propertyName", propertyName
          utils.flag @, "block.#{propertyName}", property

          @assert(
            property?
            "expected block #{block.id} to have a #{propertyName}"
            "expected block #{block.id} to not have a #{propertyName}"
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


  overwriteAnMethod = (name) ->
    overwriteChainableMethod name, name


  overwriteAnMethod "a"
  overwriteAnMethod "an"
