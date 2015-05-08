chai = require "chai"
{expect, AssertionError} = chai

regimen = require "../../src/regimen"
chai.use regimen

describe "subtypeOf", ->

  textual =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    item: "097d28bc-97bb-47e9-8d05-b7ea05deba27"
    score: 0
    type: "textual"

  headline =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    item: "097d28bc-97bb-47e9-8d05-b7ea05deba27"
    score: 0
    type: "headline"

  h1 =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    item: "097d28bc-97bb-47e9-8d05-b7ea05deba27"
    score: 0
    type: "h1"

  media =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    item: "097d28bc-97bb-47e9-8d05-b7ea05deba27"
    score: 0
    type: "media"

  context "when expecting a block to be a subtype of itself", ->
    it "should succeed", ->
      expect(textual).to.be.a.subtypeOf "textual"
      expect(textual).subtypeOf "textual"

  context "when expecting a block to be a subtype of its parent type", ->
    it "should succeed", ->
      expect(headline).to.be.a.subtypeOf "textual"
      expect(headline).subtypeOf "textual"

  context "when expecting a block to be a subtype of its grandparent type", ->
    it "should succeed", ->
      expect(h1).to.be.a.subtypeOf "textual"
      expect(h1).subtypeOf "textual"

  context "when expecting a block to not be a subtype of an unrelated type", ->
    it "should succeed", ->
      expect(media).to.not.be.a.subtypeOf "textual"
      expect(media).not.subtypeOf "textual"

  context "when expecting a block to be a subtype of an unrelated type", ->
    it "should throw an error", ->
      expect(->
        expect(media).to.be.a.subtypeOf "textual"
      ).to.throw AssertionError

      expect(->
        expect(media).subtypeOf "textual"
      ).to.throw AssertionError

  context "when expecting a block to not be a subtype of a related type", ->
    it "should throw an error", ->
      expect(->
        expect(media).to.not.be.a.subtypeOf "media"
      ).to.throw AssertionError

      expect(->
        expect(media).not.subtypeOf "media"
      ).to.throw AssertionError
