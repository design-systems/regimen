repost = require "./item/repost" # TODO: accept string, make "type"?
# expect(item).to.be.a("post").with.a("title")

cover = require "./block/cover"
description = require "./block/description"
title = require "./block/title"
subtitle = require "./block/subtitle"

subtypeOf = require "./block/subtypeOf"

module.exports = (chai, utils) ->

  # item
  repost chai, utils

  # block
  cover chai, utils
  description chai, utils
  title chai, utils
  subtitle chai, utils

  subtypeOf chai, utils
