module.exports = (chai, utils) ->

  _overwriteMethod = (preposition) ->
    (_super) -> (path) ->
      block = @_obj
      target = utils.getPathValue path, block

      if target?
        utils.flag @, "block.pathValue", path
        utils.flag @, "block.#{path}", target

        @assert(
          target?
          "expected block #{block.id} to have a #{path}"
          "expected block #{block.id} to not have a #{path}"
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
