chai = require "chai"
{expect, AssertionError} = chai

regimen = require "../../../lib/regimen"
chai.use regimen


block =
  item: 1
  id: 1
  title: "Some Title"


describe "maybe", ->

  context "when expecting a block with a path", ->

    context "to maybe have that path", ->
      it "should honor subsequent assertions", ->
        expect(block).to.maybe.have.a("title")?.length.lte 10
        expect(block).to.maybe.have.an("title")?.length.lte 10
        expect(block).with.maybe.a("title")?.length.lte 10
        expect(block).with.maybe.an("title")?.length.lte 10

        expect(->
          expect(block).to.maybe.have.a("title")?.length.gt 11
        ).to.throw AssertionError

        expect(->
          expect(block).to.maybe.have.an("title")?.length.gt 11
        ).to.throw AssertionError

        expect(->
          expect(block).with.maybe.a("title")?.length.gt 11
        ).to.throw AssertionError

        expect(->
          expect(block).with.maybe.an("title")?.length.gt 11
        ).to.throw AssertionError

    context "to maybe not have that path", ->
      it "should honor subsequent assertions", ->
        expect(block).to.maybe.not.have.a("title")?.length.lte 10
        expect(block).to.maybe.not.have.an("title")?.length.lte 10
        expect(block).with.maybe.not.a("title")?.length.lte 10
        expect(block).with.maybe.not.an("title")?.length.lte 10

        expect(->
          expect(block).to.maybe.not.have.a("title")?.length.gt 11
        ).to.throw AssertionError

        expect(->
          expect(block).to.maybe.not.have.an("title")?.length.gt 11
        ).to.throw AssertionError

        expect(->
          expect(block).with.maybe.not.a("title")?.length.gt 11
        ).to.throw AssertionError

        expect(->
          expect(block).with.maybe.not.an("title")?.length.gt 11
        ).to.throw AssertionError


  context "when expecting a block without a path", ->

    context "to maybe have that path", ->
      it "should ignore subsequent assertions", ->
        expect(block).to.maybe.have.a("subtitle")?.length.gt 11
        expect(block).to.maybe.have.an("subtitle")?.length.gt 11
        expect(block).with.maybe.a("subtitle")?.length.gt 11
        expect(block).with.maybe.an("subtitle")?.length.gt 11

    context "to maybe not have that path", ->
      it "should ignore subsequent assertions", ->
        expect(block).to.maybe.not.have.a("subtitle")?.length.gt 11
        expect(block).to.maybe.not.have.an("subtitle")?.length.gt 11
        expect(block).with.maybe.not.a("subtitle")?.length.gt 11
        expect(block).with.maybe.not.an("subtitle")?.length.gt 11
