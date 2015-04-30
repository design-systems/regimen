chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (propertyName, validBlock, invalidBlock) ->

  describe "#{propertyName} (length)", ->

    context "when expecting a block with a #{propertyName}", ->

      context "length", ->

        it "should succeed with a valid block", ->
          expected = validBlock[propertyName].length
          expect(validBlock).to.have.a(propertyName).with.length expected
          expect(validBlock).with.a(propertyName).length expected

        it "should succeed negating an invalid block", ->
          expected = validBlock[propertyName].length - 1
          expect(validBlock).to.have.a(propertyName).not.with.length expected
          expect(validBlock).with.a(propertyName).not.length expected

        it "should throw an error with an invalid block", ->
          expected = validBlock[propertyName].length - 1

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(propertyName).length expected
          ).to.throw AssertionError

        it "should throw an error negating a invalid block", ->
          expected = validBlock[propertyName].length

          expect(->
            expect(validBlock).to.have.a(propertyName).not.with.length expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(propertyName).not.length expected
          ).to.throw AssertionError


      context "above", ->

        it "should succeed with a valid block", ->
          expected = validBlock[propertyName].length - 1
          expect(validBlock).to.have.a(propertyName).with.length.above expected
          expect(validBlock).to.have.a(propertyName).with.length.gt expected
          expect(validBlock).to.have.a(propertyName).with.length.greaterThan expected

        it "should succeed negating an invalid block", ->
          expected = validBlock[propertyName].length
          expect(validBlock).to.have.a(propertyName).with.length.not.above expected
          expect(validBlock).to.have.a(propertyName).with.length.not.gt expected
          expect(validBlock).to.have.a(propertyName).with.length.not.greaterThan expected

        it "should throw an error with an invalid block", ->
          expected = validBlock[propertyName].length

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.above expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.gt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.greaterThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          expected = validBlock[propertyName].length - 1

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.not.above expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.not.gt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.not.greaterThan expected
          ).to.throw AssertionError


      context "below", ->

        it "should succeed with a valid block", ->
          expected = validBlock[propertyName].length + 1
          expect(validBlock).to.have.a(propertyName).with.length.below expected
          expect(validBlock).to.have.a(propertyName).with.length.lt expected
          expect(validBlock).to.have.a(propertyName).with.length.lessThan expected

        it "should succeed negating an invalid block", ->
          expected = validBlock[propertyName].length
          expect(validBlock).to.have.a(propertyName).with.length.not.below expected
          expect(validBlock).to.have.a(propertyName).with.length.not.lt expected
          expect(validBlock).to.have.a(propertyName).with.length.not.lessThan expected

        it "should throw an error with an invalid block", ->
          expected = validBlock[propertyName].length

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.below expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.lt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.lessThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          expected = validBlock[propertyName].length + 1

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.not.below expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.not.lt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.not.lessThan expected
          ).to.throw AssertionError


      context "within", ->
        it "should succeed with a valid block", ->
          expected = validBlock[propertyName].length
          # FIXME expect(validBlock).to.have.a(propertyName).with.length.within 0, expected
          expect(validBlock).to.have.a(propertyName).with.length.gte(0).and.lte(expected)

        it "should fail with an invalid length", ->
          expected = validBlock[propertyName].length + 1

          # FIXME expect(->
          #   expect(validBlock).to.have.a(propertyName).with.length.within 0, expected
          # )

          expect(->
            expect(validBlock).to.have.a(propertyName).with.length.gte(0).and.lte(expected)
          )
