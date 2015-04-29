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

  it "should succeed when expecting a textual block to be a subtype of textual", ->
    expect(textual).to.be.a.subtypeOf "textual"

  it "should succeed when expecting a headline block to be a subtype of textual", ->
    expect(headline).to.be.a.subtypeOf "textual"

  it "should succeed when expecting an h1 block to be a subtype of textual", ->
    expect(h1).to.be.a.subtypeOf "textual"

  it "should succeed when expecting a media block to not be a subtype of textual", ->
    expect(media).to.not.be.a.subtypeOf "textual"

  it "should throw an error when expecting a media block to be a subtype of textual", ->
    exercise = -> expect(media).to.be.a.subtypeOf "textual"
    expect(exercise).to.throw AssertionError
