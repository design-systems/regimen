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


  describe.only "temp", ->

    it "length", ->
      expect(withSubtitle).to.have.a("subtitle").with.length 8

    it "least", ->
      expect(withSubtitle).to.have.a("subtitle").with.length.at.least 8
      expect(withSubtitle).to.have.a("subtitle").with.length.gte 8

    it "most", ->
      expect(withSubtitle).to.have.a("subtitle").with.length.at.most 8
      expect(withSubtitle).to.have.a("subtitle").with.length.lte 8

    it "above", ->
      expect(withSubtitle).to.have.a("subtitle").with.length.above 7
      expect(withSubtitle).to.have.a("subtitle").with.length.gt 7
      expect(withSubtitle).to.have.a("subtitle").with.length.greaterThan 7

    it "below", ->
      expect(withSubtitle).to.have.a("subtitle").with.length.below 9
      expect(withSubtitle).to.have.a("subtitle").with.length.lt 9
      expect(withSubtitle).to.have.a("subtitle").with.length.lessThan 9


    it "within", ->
      # FIXME
      # expect(withSubtitle).to.have.a("subtitle").with.length.within 3, 8
      expect(withSubtitle).to.have.a("subtitle").with.length.gte(3).and.lte(8)


    it "equals", ->
      expect(withSubtitle).to.have.a("subtitle").that.equals "Subtitle"
      expect(withSubtitle).to.have.a("subtitle").equal "Subtitle"
      expect(withSubtitle).to.have.a("subtitle").eq "Subtitle"

    it "deep equals", ->
      expect(withSubtitle).to.have.a("subtitle").that.deep.equals "Subtitle"
      expect(withSubtitle).to.have.a("subtitle").deep.equal "Subtitle"
      expect(withSubtitle).to.have.a("subtitle").that.eqls "Subtitle"
      expect(withSubtitle).to.have.a("subtitle").eql "Subtitle"
