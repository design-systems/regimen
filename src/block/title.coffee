equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"

module.exports = (chai, utils) ->
  property = "title"
  equality.call @, chai, utils, property
  existence.call @, chai, utils, property
  length.call @, chai, utils, property
