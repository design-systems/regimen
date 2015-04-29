repost = require "./item/repost" # TODO: accept string, make "type"?
# expect(item).to.be.a("post").with.a("title")

cover = require "./block/cover"
description = require "./block/description"
html = require "./block/html"
title = require "./block/title"
subtitle = require "./block/subtitle"

ofType = require "./block/ofType"
subtypeOf = require "./block/subtypeOf"


module.exports = (chai, utils) ->

  # item
  repost chai, utils

  # block
  cover chai, utils
  description chai, utils
  html chai, utils
  title chai, utils
  subtitle chai, utils

  # block types
  ofType chai, utils
  subtypeOf chai, utils
