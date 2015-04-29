chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (property, validBlock, invalidBlock) ->

  describe "#{property} (equality)", ->

    context "when expecting a block with a #{property}", ->

      context "equals", ->

        it "should succeed with a valid block", ->
          expected = validBlock[property]
          expect(validBlock).to.have.a(property).that.equals expected
          expect(validBlock).to.have.a(property).equal expected
          expect(validBlock).to.have.a(property).eq expected

        it "should throw an error with an invalid block", ->
          expected = ""

          expect(->
            expect(validBlock).to.have.a(property).that.equals expected
          )

          expect(->
            expect(validBlock).to.have.a(property).equal expected
          )

          expect(->
            expect(validBlock).to.have.a(property).eq expected
          )


      context "deep equals", ->
        it "should succeed with a valid block", ->
          expected = validBlock[property]
          expect(validBlock).to.have.a(property).that.deep.equals expected
          expect(validBlock).to.have.a(property).deep.equal expected
          expect(validBlock).to.have.a(property).that.eqls expected
          expect(validBlock).to.have.a(property).eql expected


        it "should throw an error with an invalid block", ->
          expected = ""

          expect(->
            expect(validBlock).to.have.a(property).that.deep.equals expected
          )

          expect(->
            expect(validBlock).to.have.a(property).deep.equal expected
          )

          expect(->
            expect(validBlock).to.have.a(property).that.eqls expected
          )

          expect(->
            expect(validBlock).to.have.a(property).eql expected
          )
