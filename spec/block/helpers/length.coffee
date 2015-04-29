chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (property, validBlock, invalidBlock) ->

  describe "#{property} (length)", ->

    context "when expecting a block with a #{property}", ->

      context "length", ->

        it "should succeed with a valid block", ->
          expected = validBlock[property].length
          expect(validBlock).to.have.a(property).with.length expected
          expect(validBlock).with.a(property).length expected

        it "should throw an error with an invalid block", ->
          expected = validBlock[property].length - 1

          expect(->
            expect(validBlock).to.have.a(property).with.length expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(property).length expected
          ).to.throw AssertionError


      context "above", ->

        it "should succeed with a valid block", ->
          expected = validBlock[property].length - 1
          expect(validBlock).to.have.a(property).with.length.above expected
          expect(validBlock).to.have.a(property).with.length.gt expected
          expect(validBlock).to.have.a(property).with.length.greaterThan expected

        it "should throw an error with an invalid block", ->
          expected = validBlock[property].length

          expect(->
            expect(validBlock).to.have.a(property).with.length.above expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).with.length.gt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).with.length.greaterThan expected
          ).to.throw AssertionError


      context "below", ->

        it "should succeed with a valid block", ->
          expected = validBlock[property].length + 1
          expect(validBlock).to.have.a(property).with.length.below expected
          expect(validBlock).to.have.a(property).with.length.lt expected
          expect(validBlock).to.have.a(property).with.length.lessThan expected

        it "should throw an error with an invalid block", ->
          expected = validBlock[property].length

          expect(->
            expect(validBlock).to.have.a(property).with.length.below expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).with.length.lt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).with.length.lessThan expected
          ).to.throw AssertionError


      context "within", ->
        it "should succeed with a valid block", ->
          expected = validBlock[property].length
          # FIXME expect(validBlock).to.have.a(property).with.length.within 0, expected
          expect(validBlock).to.have.a(property).with.length.gte(0).and.lte(expected)

        it "should fail with an invalid length", ->
          expected = validBlock[property].length + 1

          # FIXME expect(->
          #   expect(validBlock).to.have.a(property).with.length.within 0, expected
          # )

          expect(->
            expect(validBlock).to.have.a(property).with.length.gte(0).and.lte(expected)
          )
