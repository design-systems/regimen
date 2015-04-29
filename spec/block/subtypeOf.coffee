chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../src/chai-grid"
chai.use grid

describe "subtypeOf", ->

  textual =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    type: "textual"

  headline =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    type: "headline"

  h1 =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    type: "h1"

  media =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    type: "media"

  context "when expecting a block to be a subtype of itself", ->
    it "should succeed", ->
      expect(textual).to.be.a.subtypeOf "textual"

  context "when expecting a block to be a subtype of its parent type", ->
    it "should succeed", ->
      expect(headline).to.be.a.subtypeOf "textual"

  context "when expecting a block to be a subtype of its grandparent type", ->
    it "should succeed", ->
      expect(h1).to.be.a.subtypeOf "textual"

  context "when expecting a block to not be a subtype of an unrelated type", ->
    it "should succeed", ->
      expect(media).to.not.be.a.subtypeOf "textual"

  context "when expecting a block to be a subtype of an unrelated type", ->
    it "should throw an error", ->
      expect(->
        expect(media).to.be.a.subtypeOf "textual"
      ).to.throw AssertionError
