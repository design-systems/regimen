chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../src/chai-grid"
chai.use grid

describe "description", ->

  withDescription =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    description: "Description"

  withoutDescription =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"

  it "should succeed when expecting a block with a description to have a description", ->
    expect(withDescription).to.have.a.description

  it "should succeed when expecting a block without a description to not have a description", ->
    expect(withoutDescription).to.not.have.a.description

  it "should throw an error when expecting a block without a description to have a description", ->
    exercise = -> expect(withoutDescription).to.have.a.description
    expect(exercise).to.throw AssertionError

  it "should throw an error when expecting a block with a description to not have a description", ->
    exercise = -> expect(withDescription).to.not.have.a.description
    expect(exercise).to.throw AssertionError
