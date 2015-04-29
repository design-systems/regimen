equality = require "./helpers/equality"
existence = require "./helpers/existence"

module.exports = (chai, utils) ->
  property = "cover"
  equality.call @, chai, utils, property
  existence.call @, chai, utils, property
