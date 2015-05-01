chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/regimen"
chai.use grid

module.exports = (path, validBlock) ->

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

        it "should throw an error negating a invalid length", ->
          value = chai.util.getPathValue path, validBlock
          expected = value.length

          expect(->
            expect(validBlock).with.a(path).not.with.length expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.a(path).not.length expected
          ).to.throw AssertionError
