equality = require "./helpers/equality"
existence = require "./helpers/existence"

validBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
  cover:
    src: "cover.jpg"
    width: 1600
    height: 900

invalidBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"

property = "cover"
equality property, validBlock, invalidBlock
existence property, validBlock, invalidBlock



chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../src/chai-grid"
chai.use grid



describe "cover (properties)", ->

  context "when expecting a block with a cover with an orientation", ->

    block =
      id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
      cover:
        src: "cover.jpg"
        width: 1600
        height: 900
        orientation: "portrait"

    context "to have an orientation", ->
      it "should succeed", ->
        expect(block).to.have.a("cover").with.orientation
        expect(block).to.have.a("cover").with.an.orientation
        expect(block).with.a("cover").with.orientation
        expect(block).with.a("cover").with.an.orientation

    context "to not have an orientation", ->
      it "should throw an error", ->
        expect(->
          expect(block).to.have.a("cover").not.with.orientation
        ).to.throw AssertionError

        expect(->
          expect(block).to.have.a("cover").not.with.an.orientation
        ).to.throw AssertionError

        expect(->
          expect(block).with.a("cover").not.with.orientation
        ).to.throw AssertionError

        expect(->
          expect(block).with.a("cover").not.with.an.orientation
        ).to.throw AssertionError

  context "when expecting a block with a cover without an orientation", ->

    block =
      id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
      cover:
        src: "cover.jpg"
        width: 1600
        height: 900

    context "to not have an orientation", ->
      it "should succeed", ->
        expect(block).to.have.a("cover").not.with.orientation
        expect(block).to.have.a("cover").not.with.an.orientation
        expect(block).with.a("cover").not.with.orientation
        expect(block).with.a("cover").not.with.an.orientation

    context "to have an orientation", ->
      it "should throw an error", ->
        expect(->
          expect(block).to.have.a("cover").with.orientation
        ).to.throw AssertionError

        expect(->
          expect(block).to.have.a("cover").with.an.orientation
        ).to.throw AssertionError

        expect(->
          expect(block).with.a("cover").with.orientation
        ).to.throw AssertionError

        expect(->
          expect(block).with.a("cover").with.an.orientation
        ).to.throw AssertionError
