equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"

module.exports = (chai, utils) ->
  equality.call @, chai, utils
  existence.call @, chai, utils
  length.call @, chai, utils
