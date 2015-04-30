chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (propertyName, validBlock, invalidBlock) ->

  describe "#{propertyName} (existence)", ->

    context "when expecting a block with a #{propertyName}", ->

      context "to have a #{propertyName}", ->
        it "should succeed", ->
          expect(validBlock).to.have.a propertyName
          expect(validBlock).to.have.an propertyName
          expect(validBlock).with.a propertyName
          expect(validBlock).with.an propertyName

      context "to not have a #{propertyName}", ->
        it "should throw an error", ->
          expect(->
            expect(validBlock).to.not.have.a propertyName
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.not.have.an propertyName
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.not.a propertyName
          ).to.throw AssertionError

          expect(->
            expect(validBlock).with.not.an propertyName
          ).to.throw AssertionError


    context "when expecting a block without a #{propertyName}", ->

      context "to not have a #{propertyName}", ->
        it "should succeed", ->
          expect(invalidBlock).to.not.have.a propertyName
          expect(invalidBlock).to.not.have.an propertyName
          expect(invalidBlock).not.with.a propertyName
          expect(invalidBlock).not.with.an propertyName

      context "to have a #{propertyName}", ->
        it "should throw an error", ->
          expect(->
            expect(invalidBlock).to.have.a propertyName
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).to.have.an propertyName
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).with.a propertyName
          ).to.throw AssertionError

          expect(->
            expect(invalidBlock).with.an propertyName
          ).to.throw AssertionError
