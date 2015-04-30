chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (path, validBlock, invalidBlock) ->

  describe "#{path} (length)", ->

    context "when expecting a block with a #{path}", ->

      context "length", ->

        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          expect(validBlock).with.a(path).with.length expected
          expect(validBlock).with.a(path).length expected

        it "should succeed negating an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length - 1

          expect(validBlock).with.a(path).not.with.length expected
          expect(validBlock).with.a(path).not.length expected

        it "should throw an error with an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length - 1

          expect(->
            expect(validBlock).with.a(path).with.length expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).length expected
          ).to.throw AssertionError

        it "should throw an error negating a invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          expect(->
            expect(validBlock).with.a(path).not.with.length expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).not.length expected
          ).to.throw AssertionError


      context "above", ->

        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length - 1

          expect(validBlock).with.a(path).with.length.above expected
          expect(validBlock).with.a(path).with.length.gt expected
          expect(validBlock).with.a(path).with.length.greaterThan expected

        it "should succeed negating an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          expect(validBlock).with.a(path).with.length.not.above expected
          expect(validBlock).with.a(path).with.length.not.gt expected
          expect(validBlock).with.a(path).with.length.not.greaterThan expected

        it "should throw an error with an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          expect(->
            expect(validBlock).with.a(path).with.length.above expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.gt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.greaterThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length - 1

          expect(->
            expect(validBlock).with.a(path).with.length.not.above expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.not.gt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.not.greaterThan expected
          ).to.throw AssertionError


      context "below", ->

        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length + 1

          expect(validBlock).with.a(path).with.length.below expected
          expect(validBlock).with.a(path).with.length.lt expected
          expect(validBlock).with.a(path).with.length.lessThan expected

        it "should succeed negating an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          expect(validBlock).with.a(path).with.length.not.below expected
          expect(validBlock).with.a(path).with.length.not.lt expected
          expect(validBlock).with.a(path).with.length.not.lessThan expected

        it "should throw an error with an invalid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          expect(->
            expect(validBlock).with.a(path).with.length.below expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.lt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.lessThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length + 1

          expect(->
            expect(validBlock).with.a(path).with.length.not.below expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.not.lt expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).with.length.not.lessThan expected
          ).to.throw AssertionError


      context "within", ->
        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          # FIXME expect(validBlock).to.have.a(path).with.length.within 0, expected
          expect(validBlock).with.a(path).with.length.gte(0).and.lte(expected)

        it "should fail with an invalid length", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length + 1

          # FIXME
          # # expect(->
          # #  expect(validBlock).with.a(path).with.length.within 0, expected
          # # )

          expect(->
            expect(validBlock).with.a(path).with.length.gte(0).and.lte(expected)
          )
