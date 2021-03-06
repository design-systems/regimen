module.exports = (chai, utils) ->

  _overwriteMethod = (preposition) ->
    (_super) -> (path) ->
      looksLikeBlock = (utils.type(@_obj) is "object") and @_obj.item?

      if looksLikeBlock
        maybe = utils.flag @, "block.maybe"
        block = @_obj
        target = utils.getPathValue path, block
        utils.flag @, "block.pathValue", path

        if maybe is true
          utils.flag @, "negate", false
          return null unless target?

        if block.id?
          messageText = "block #{block.id}"
        else
          messageText = "block from item #{block.item}"

        @assert(
          target?
          "expected #{messageText} to have #{preposition} #{path}"
          "expected #{messageText} to not have #{preposition} #{path}"
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
