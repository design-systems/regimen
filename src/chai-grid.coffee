repost = require "./item/repost" # TODO: accept string, make "type"?
# expect(item).to.be.a("post").with.a("title")

ofType = require "./block/ofType"
subtypeOf = require "./block/subtypeOf"

contains = require "./block/helpers/contains"
equality = require "./block/helpers/equality"
existence = require "./block/helpers/existence"
length = require "./block/helpers/length"

cover = require "./block/cover"


module.exports = (chai, utils) ->

  # item
  repost.apply @, arguments

  # block types
  ofType.apply @, arguments
  subtypeOf.apply @, arguments

  # block helpers
  contains.apply @, arguments
  equality.apply @, arguments
  existence.apply @, arguments
  length.apply @, arguments

  # block.properties
  cover.apply @, arguments
