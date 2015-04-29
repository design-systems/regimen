chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../src/chai-grid"
chai.use grid

describe "subtitle", ->

  withSubtitle =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
    subtitle: "Subtitle"

  withoutSubtitle =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f3"

  it "should succeed when expecting a block with a subtitle to have a subtitle", ->
    expect(withSubtitle).to.have.a.subtitle

  it "should succeed when expecting a block without a subtitle to not have a subtitle", ->
    expect(withoutSubtitle).to.not.have.a.subtitle

  it "should throw an error when expecting a block without a subtitle to have a subtitle", ->
    exercise = -> expect(withoutSubtitle).to.have.a.subtitle
    expect(exercise).to.throw AssertionError

  it "should throw an error when expecting a block with a subtitle to not have a subtitle", ->
    exercise = -> expect(withSubtitle).to.not.have.a.subtitle
    expect(exercise).to.throw AssertionError

  # it.only "should succeed when expecting a block with a specific length", ->
  #   # console.log expect(withSubtitle).to.have.a.subtitle
  #   # console.log expect(withSubtitle).to.have.a.subtitle.and.to.have.length
  #   expect(withSubtitle).to.have.a.subtitle.and.to.have.length.below 9
