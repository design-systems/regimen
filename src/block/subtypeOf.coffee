_subtypeOf = require "./_subtypeOf"

module.exports = (chai, utils) ->
  chai.Assertion.addMethod "subtypeOf", (expectedType) ->
    block = @_obj
    _subtypeOf.call @, block, expectedType
