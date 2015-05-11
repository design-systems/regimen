chai = require "chai"
{expect, AssertionError} = chai

regimen = require "../../src/regimen"
chai.use regimen

describe "ofType", ->

  block =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    item: "097d28bc-97bb-47e9-8d05-b7ea05deba27"
    type: "media"

  context "when expecting a block to be its type", ->
    it "should succeed", ->
      expect(block).to.be.ofType "media"
      expect(block).ofType "media"

  context "when expecting a block to not be another type", ->
    it "should succeed", ->
      expect(block).to.not.be.ofType "video"
      expect(block).not.ofType "video"

  context "when expecting a block to be another type", ->
    it "should throw an error", ->
      expect(->
        expect(block).to.be.ofType "video"
      ).to.throw AssertionError

      expect(->
        expect(block).ofType "video"
      ).to.throw AssertionError

  context "when expecting a block to not be its type", ->
    it "should throw an error", ->
      expect(->
        expect(block).to.not.be.ofType "media"
      ).to.throw AssertionError

      expect(->
        expect(block).not.ofType "media"
      ).to.throw AssertionError
