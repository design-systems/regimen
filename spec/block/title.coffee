chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../src/chai-grid"
chai.use grid

describe "title", ->

  withTitle =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    title: "Title"

  withoutTitle =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"

  it "should succeed when expecting a block with a title to have a title", ->
    expect(withTitle).to.have.a.title

  it "should succeed when expecting a block without a title to not have a title", ->
    expect(withoutTitle).to.not.have.a.title

  it "should throw an error when expecting a block without a title to have a title", ->
    exercise = -> expect(withoutTitle).to.have.a.title
    expect(exercise).to.throw AssertionError

  it "should throw an error when expecting a block with a title to not have a title", ->
    exercise = -> expect(withTitle).to.not.have.a.title
    expect(exercise).to.throw AssertionError
