module.exports = (chai, utils) ->

  _overwriteMethod = (preposition) ->
    (_super) -> (path) ->
      looksLikeBlock = (utils.type(@_obj) is "object") and @_obj.item?

      if looksLikeBlock
        block = @_obj
        target = utils.getPathValue path, block
        utils.flag @, "block.pathValue", path

        @assert(
          target?
          "expected block #{block.id} to have #{preposition} #{path}"
          "expected block #{block.id} to not have #{preposition} #{path}"
        )
      else
        _super.apply @, arguments

  overwriteChainableMethod = (name, preposition) ->
    method = _overwriteMethod preposition
    property = (_super) -> _super
    chai.Assertion.overwriteChainableMethod name, method, property


  overwriteAnMethod = (name) ->
    overwriteChainableMethod name, name


  overwriteAnMethod "a"
  overwriteAnMethod "an"
