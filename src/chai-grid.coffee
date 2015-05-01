methods = require "./assertion/methods"
properties = require "./assertion/properties"

repost = require "./item/repost" # TODO: accept string, make "type"?
# expect(item).to.be.a("post").with.a("title")

ofType = require "./block/ofType"
subtypeOf = require "./block/subtypeOf"

contains = require "./block/helpers/contains"
comparison = require "./block/helpers/comparison"
equality = require "./block/helpers/equality"
existence = require "./block/helpers/existence"
length = require "./block/helpers/length"


module.exports = (chai, utils) ->

  methods chai, utils
  properties chai, utils

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
