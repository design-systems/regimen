repost = require "./item/repost" # TODO: accept string, make "type"?
# expect(item).to.be.a("post").with.a("title")

ofType = require "./block/ofType"
subtypeOf = require "./block/subtypeOf"

contains = require "./block/helpers/contains"
comparison = require "./block/helpers/comparison"
equality = require "./block/helpers/equality"
existence = require "./block/helpers/existence"
length = require "./block/helpers/length"

cover = require "./block/cover"


module.exports = (chai, utils) ->

  # item
  repost chai, utils

  # block types
  ofType chai, utils
  subtypeOf chai, utils

  # block helpers
  contains chai, utils
  comparison chai, utils
  equality chai, utils
  existence chai, utils
  length chai, utils

  # block.properties
  cover chai, utils
