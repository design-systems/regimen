repost = require "./item/repost" # TODO: accept string, make "type"?

property = require "./block/property"
subtypeOf = require "./block/subtypeOf"

module.exports = (chai, utils) ->

  # item
  repost chai, utils

  # block
  subtypeOf chai, utils
  property chai, utils
