comparison = require "./helpers/comparison"
contains = require "./helpers/contains"
equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"


validBlock =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
      height: 48
  ]

anotherValidBlock =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec87"
  author: [
    name: "thegridio"
    url: "http://twitter.com/thegridio"
    avatar:
      src: "https://pbs.twimg.com/profile_images/509869928695230464/sob_gOga_normal.jpeg"
      width: 72
      height: 72
  ]

blockWithoutAuthor =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"

blockWithoutAuthorName =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
      height: 48
  ]

blockWithoutAuthorUrl =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
      height: 48
  ]

blockWithoutAuthorAvatar =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
  ]

blockWithoutAuthorAvatarSrc =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      width: 48
      height: 48
  ]

blockWithoutAuthorAvatarWidth =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      height: 48
  ]

blockWithoutAuthorAvatarHeight =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
  ]


equality "author", validBlock, anotherValidBlock
existence "author", validBlock, blockWithoutAuthor
length "author", validBlock

contains "author[0].name", validBlock
equality "author[0].name", validBlock, anotherValidBlock
existence "author[0].name", validBlock, blockWithoutAuthorName
length "author[0].name", validBlock

contains "author[0].url", validBlock
equality "author[0].url", validBlock, anotherValidBlock
existence "author[0].url", validBlock, blockWithoutAuthorUrl
length "author[0].url", validBlock

equality "author[0].avatar", validBlock, anotherValidBlock
existence "author[0].avatar", validBlock, blockWithoutAuthorAvatar

contains "author[0].avatar.src", validBlock
equality "author[0].avatar.src", validBlock, anotherValidBlock
existence "author[0].avatar.src", validBlock, blockWithoutAuthorAvatarSrc
length "author[0].avatar.src", validBlock

comparison "author[0].avatar.width", validBlock
equality "author[0].avatar.width", validBlock, anotherValidBlock
existence "author[0].avatar.width", validBlock, blockWithoutAuthorAvatarWidth

comparison "author[0].avatar.height", validBlock
equality "author[0].avatar.height", validBlock, anotherValidBlock
existence "author[0].avatar.height", validBlock, blockWithoutAuthorAvatarHeight


chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../src/chai-grid"
chai.use grid


describe.skip "author", ->

  describe "name", ->

    context "when expecting a block with an author with a name", ->

      block = validBlock

      context "to have a name", ->
        it "should succeed", ->

      context "to not have a name", ->
        it "should throw an error", ->

    context "when expecting a block with an author without a name", ->

      block = blockWithoutAuthorName

      context "to not have a name", ->
        it "should succeed", ->

      context "to have a name", ->
        it "should throw an error", ->


  describe "url", ->

    context "when expecting a block with an author with a url", ->

      block = validBlock

      context "to have a url", ->
        it "should succeed", ->

      context "to not have a url", ->
        it "should throw an error", ->

    context "when expecting a block with an author without a url", ->

      block = blockWithoutAuthorUrl

      context "to not have a url", ->
        it "should succeed", ->

      context "to have a url", ->
        it "should throw an error", ->


  describe "avatar", ->

    context "when expecting a block with an author with an avatar", ->

      block = validBlock

      context "to have an avatar", ->
        it "should succeed", ->

      context "to not have an avatar", ->
        it "should throw an error", ->

    context "when expecting a block with an author without an avatar", ->

      block = blockWithoutAuthorAvatar

      context "to not have an avatar", ->
        it "should succeed", ->

      context "to have an avatar", ->
        it "should throw an error", ->


  describe "avatar src", ->

    context "when expecting a block with an author with an avatar src", ->

      block = validBlock

      context "to have an avatar src", ->
        it "should succeed", ->

      context "to not have an avatar src", ->
        it "should throw an error", ->

    context "when expecting a block with an author without an avatar src", ->

      block = blockWithoutAuthorAvatarSrc

      context "to not have an avatar src", ->
        it "should succeed", ->

      context "to have an avatar src", ->
        it "should throw an error", ->


  describe "avatar width", ->

    context "when expecting a block with an author with an avatar width", ->

      block = validBlock

      context "to have an avatar width", ->
        it "should succeed", ->

      context "to not have an avatar width", ->
        it "should throw an error", ->

    context "when expecting a block with an author without an avatar width", ->

      block = blockWithoutAuthorAvatarWidth

      context "to not have an avatar width", ->
        it "should succeed", ->

      context "to have an avatar width", ->
        it "should throw an error", ->


  describe "avatar height", ->

    context "when expecting a block with an author with an avatar height", ->

      block = validBlock

      context "to have an avatar height", ->
        it "should succeed", ->

      context "to not have an avatar height", ->
        it "should throw an error", ->

    context "when expecting a block with an author without an avatar height", ->

      block = blockWithoutAuthorAvatarHeight

      context "to not have an avatar height", ->
        it "should succeed", ->

      context "to have an avatar height", ->
        it "should throw an error", ->
