chai = require "chai"
{expect, AssertionError} = chai

regimen = require "../../src/regimen"
chai.use regimen

describe "repost", ->

  itemWithOneMediaBlock =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    content: [
      id: "88c63e90-803b-4a20-8384-a14b0c4900f2"
      type: "media"
    ]

  itemWithOneNonMediaBlock =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    content: [
      id: "88c63e90-803b-4a20-8384-a14b0c4900f2"
      type: "text"
    ]

  itemWithTwoMediaBlocks =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    content: [
      id: "88c63e90-803b-4a20-8384-a14b0c4900f2"
      type: "video"
    ,
      id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
      type: "audio"
    ]

  itemWithNoBlocks =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    content: []


  context "when expecting an item with one media block to be a repost", ->
    it "should succeed", ->
      expect(itemWithOneMediaBlock).to.be.a.repost

  context "when expecting an item with one media block to not be a repost", ->
    it "should throw an error", ->
      expect(->
        expect(itemWithOneMediaBlock).to.not.be.a.repost
      ).to.throw AssertionError


  context "when expecting an item with one non-media block to not be a repost", ->
    it "should succeed", ->
      expect(itemWithOneNonMediaBlock).to.not.be.a.repost

  context "when expecting an item with one non-media block to be a repost", ->
    it "should throw an error", ->
      expect(->
        expect(itemWithOneNonMediaBlock).to.be.a.repost
      ).to.throw AssertionError


  context "when expecting an item with two media blocks to not be a repost", ->
    it "should succeed", ->
      expect(itemWithTwoMediaBlocks).to.not.be.a.repost

  context "when expecting an item with two media blocks to be a repost", ->
    it "should throw an error", ->
      expect(->
        expect(itemWithTwoMediaBlocks).to.be.a.repost
      ).to.throw AssertionError


  context "when expecting an item with no blocks to not be a repost", ->
    it "should succeed", ->
      expect(itemWithNoBlocks).to.not.be.a.repost

  context "when expecting an item with no blocks to be a repost", ->
    it "should throw an error", ->
      expect(->
        expect(itemWithNoBlocks).to.be.a.repost
      ).to.throw AssertionError
