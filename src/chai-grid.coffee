repost = require "./item/repost"

description = require "./block/description"
subtypeOf = require "./block/subtypeOf"
title = require "./block/title"
subtitle = require "./block/subtitle"

module.exports = (chai, utils) ->

  # item
  repost chai, utils

  # block
  description chai, utils
  subtitle chai, utils
  subtypeOf chai, utils
  title chai, utils
