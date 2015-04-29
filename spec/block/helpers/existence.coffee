chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (property, validBlock, invalidBlock) ->

  describe "#{property} (existence)", ->

    context "when expecting a block with a #{property}", ->

      context "to have a #{property}", ->
        it "should succeed", ->
          expect(validBlock).to.have.a property
          expect(validBlock).to.have.an property
          expect(validBlock).with.a property
          expect(validBlock).with.an property

      context "to not have a #{property}", ->
        it "should throw an error", ->
          expect(->
            expect(validBlock).to.not.have.a property
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.not.have.an property
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.not.a property
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.not.an property
          ).to.throw AssertionError


    context "when expecting a block without a #{property}", ->

      context "to not have a #{property}", ->
        it "should succeed", ->
          expect(invalidBlock).to.not.have.a property
          expect(invalidBlock).to.not.have.an property
          expect(invalidBlock).not.with.a property
          expect(invalidBlock).not.with.an property

      context "to have a #{property}", ->
        it "should throw an error", ->
          expect(->
            expect(invalidBlock).to.have.a property
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).to.have.an property
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).with.a property
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).with.an property
          ).to.throw AssertionError
