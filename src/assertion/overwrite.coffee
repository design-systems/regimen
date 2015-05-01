_overwriteMethod = (chai, utils, preposition, actualPath) ->
  (_super) -> (expected) ->
    block = @_obj
    path = utils.flag @, "block.pathValue"
    target = utils.getPathValue path, block

    if target?
      negated = utils.flag @, "negate"
      utils.flag @, "object", target
      actual = target
      actual = utils.getPathValue actualPath, target if actualPath?

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

    method: (name, preposition, path) ->
      method = _overwriteMethod chai, utils, preposition, path
      chai.Assertion.overwriteMethod name, method

    chainableMethod: (name, preposition, path) ->
      method = _overwriteMethod chai, utils, preposition, path
      property = (_super) -> _super
      chai.Assertion.overwriteChainableMethod name, method, property
