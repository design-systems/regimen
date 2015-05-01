chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/regimen"
chai.use grid

module.exports = (path, validBlock, invalidBlock) ->

  describe "#{path} (existence)", ->

    context "when expecting a block with a #{path}", ->

      context "to have a #{path}", ->
        it "should succeed", ->
          expect(validBlock).to.have.a path
          expect(validBlock).to.have.an path
          expect(validBlock).with.a path
          expect(validBlock).with.an path

      context "to not have a #{path}", ->
        it "should throw an error", ->
          expect(->
            expect(validBlock).to.not.have.a path
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.not.have.an path
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.not.a path
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.not.an path
          ).to.throw AssertionError


    context "when expecting a block without a #{path}", ->

      context "to not have a #{path}", ->
        it "should succeed", ->
          expect(invalidBlock).to.not.have.a path
          expect(invalidBlock).to.not.have.an path
          expect(invalidBlock).not.with.a path
          expect(invalidBlock).not.with.an path

      context "to have a #{path}", ->
        it "should throw an error", ->
          expect(->
            expect(invalidBlock).to.have.a path
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).to.have.an path
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).with.a path
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).with.an path
          ).to.throw AssertionError
