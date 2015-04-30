_overwriteMethod = (chai, utils, preposition) ->
  (_super) -> (expected) ->
    block = @_obj
    path = utils.flag @, "block.pathValue"
    target = utils.getPathValue path, block

    if target?
      negated = utils.flag @, "negate"
      utils.flag @, "object", target
      actual = target

      try
        _super.apply @, arguments
        result = true
      catch e
        result = false

      @assert(
        if negated then not result else result
        "expected block #{block.id} to have a #{path} #{preposition} \#{exp} but got \#{act}"
        "expected block #{block.id} to not have a #{path} #{preposition} \#{exp} but got \#{act}"
        expected
        actual
      )
    else
      _super.apply @, arguments

module.exports = (chai, utils) ->

  overwrite =

    method: (name, preposition) ->
      method = _overwriteMethod chai, utils, preposition
      chai.Assertion.overwriteMethod name, method

    chainableMethod: (name, preposition) ->
      method = _overwriteMethod chai, utils, preposition
      property = (_super) -> _super
      chai.Assertion.overwriteChainableMethod name, method, property
