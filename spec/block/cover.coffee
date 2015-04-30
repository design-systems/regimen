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



describe "cover", ->

  describe "src", ->

    context "when expecting a block with a cover with a src", ->

      block =
        id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
        cover:
          src: "cover.jpg"

      context "to have a src", ->
        it "should succeed", ->
          expect(block).to.have.a("cover").with.src
          expect(block).to.have.a("cover").with.a.src
          expect(block).to.have.a("cover").src

          expect(block).with.a("cover").with.src
          expect(block).with.a("cover").with.a.src
          expect(block).with.a("cover").src

      context "to not have a src", ->
        it "should throw an error", ->
          expect(->
            expect(block).to.have.a("cover").not.with.src
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").not.with.a.src
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").not.src
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").not.with.src
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").not.with.a.src
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").not.src
          ).to.throw AssertionError

    context "when expecting a block with a cover without a src", ->

      block =
        id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
        cover: {}

      context "to not have a src", ->
        it "should succeed", ->
          expect(block).to.have.a("cover").not.with.src
          expect(block).to.have.a("cover").not.with.a.src
          expect(block).to.have.a("cover").not.src

          expect(block).with.a("cover").not.with.src
          expect(block).with.a("cover").not.with.a.src
          expect(block).with.a("cover").not.src

      context "to have a src", ->
        it "should throw an error", ->
          expect(->
            expect(block).to.have.a("cover").with.src
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").with.a.src
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").src
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").with.src
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").with.a.src
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").src
          ).to.throw AssertionError


  describe "orientation", ->

    context "when expecting a block with a cover with an orientation", ->

      block =
        id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
        cover:
          orientation: "portrait"

      context "to have an orientation", ->
        it "should succeed", ->
          expect(block).to.have.a("cover").with.orientation()
          expect(block).to.have.a("cover").with.an.orientation()
          expect(block).to.have.a("cover").orientation()
          expect(block).to.have.a("cover").oriented()

          expect(block).with.a("cover").with.orientation()
          expect(block).with.a("cover").with.an.orientation()
          expect(block).with.a("cover").orientation()
          expect(block).with.a("cover").oriented()

      context "to not have an orientation", ->
        it "should throw an error", ->
          expect(->
            expect(block).to.have.a("cover").not.with.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").not.with.an.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").not.oriented()
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").not.with.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").not.with.an.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").not.oriented()
          ).to.throw AssertionError

      context "to have a specific orientation", ->

        it "should succeed with a valid block", ->
          expect(block).to.have.a("cover").with.orientation "portrait"
          expect(block).with.a("cover").oriented "portrait"

        it "should throw an error with an invalid block", ->
          expect(->
            expect(block).to.have.a("cover").with.orientation "landscape"
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").oriented "landscape"
          ).to.throw AssertionError

      context "to not have a specific orientation", ->

        it "should succeed with an invalid block", ->
          expect(block).to.have.a("cover").not.with.orientation "landscape"
          expect(block).with.a("cover").not.oriented "landscape"

        it "should throw an error with a valid block", ->
          expect(->
            expect(block).to.have.a("cover").not.with.orientation "portrait"
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").not.oriented "portrait"
          ).to.throw AssertionError


    context "when expecting a block with a cover without an orientation", ->

      block =
        id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
        cover: {}

      context "to not have an orientation", ->
        it "should succeed", ->
          expect(block).to.have.a("cover").not.with.orientation()
          expect(block).to.have.a("cover").not.with.an.orientation()
          expect(block).to.have.a("cover").not.oriented()

          expect(block).with.a("cover").not.with.orientation()
          expect(block).with.a("cover").not.with.an.orientation()
          expect(block).with.a("cover").not.oriented()

      context "to have an orientation", ->
        it "should throw an error", ->
          expect(->
            expect(block).to.have.a("cover").with.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").with.an.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).to.have.a("cover").oriented()
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").with.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").with.an.orientation()
          ).to.throw AssertionError

          expect(->
            expect(block).with.a("cover").oriented()
          ).to.throw AssertionError
