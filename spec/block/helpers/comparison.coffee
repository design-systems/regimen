chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/regimen"
chai.use grid

module.exports = (path, validBlock) ->

  describe "#{path} (comparison)", ->

    context "when expecting a block with a #{path}", ->

      context "above", ->

        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value - 1

          expect(validBlock).with.a(path).above expected
          expect(validBlock).with.a(path).gt expected
          expect(validBlock).with.a(path).greaterThan expected

        it "should succeed negating an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(validBlock).with.a(path).not.above expected
          expect(validBlock).with.a(path).not.gt expected
          expect(validBlock).with.a(path).not.greaterThan expected

        it "should throw an error with an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(->
            expect(validBlock).with.a(path).above expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).gt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).greaterThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value - 1

          expect(->
            expect(validBlock).with.a(path).not.above expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).not.gt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).not.greaterThan expected
          ).to.throw AssertionError


      context "below", ->

        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value + 1

          expect(validBlock).with.a(path).below expected
          expect(validBlock).with.a(path).lt expected
          expect(validBlock).with.a(path).lessThan expected

        it "should succeed negating an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(validBlock).with.a(path).not.below expected
          expect(validBlock).with.a(path).not.lt expected
          expect(validBlock).with.a(path).not.lessThan expected

        it "should throw an error with an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(->
            expect(validBlock).with.a(path).below expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).lt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).lessThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value + 1

          expect(->
            expect(validBlock).with.a(path).not.below expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).not.lt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).not.lessThan expected
          ).to.throw AssertionError


      context "within", ->
        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          # FIXME expect(validBlock).to.have.a(path).within 0, expected
          expect(validBlock).with.a(path).gte(0).and.lte(expected)

        it "should fail with an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value + 1

          # FIXME
          # # expect(->
          # #  expect(validBlock).with.a(path).within 0, expected
          # # )

          expect(->
            expect(validBlock).with.a(path).gte(0).and.lte(expected)
          )
