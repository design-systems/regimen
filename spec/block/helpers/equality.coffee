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
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).eq expected
          ).to.throw AssertionError

        it "should succeed negating an invalid block", ->
          expected = ""
          expect(validBlock).to.have.a(property).that.not.equals expected
          expect(validBlock).to.have.a(property).not.equal expected
          expect(validBlock).to.have.a(property).not.eq expected

        it "should throw an error negating a valid block", ->
          expected = validBlock[property]

          expect(->
            expect(validBlock).to.have.a(property).that.not.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).not.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).not.eq expected
          ).to.throw AssertionError


      context "deep equals", ->
        it "should succeed with a valid block", ->
          expected = validBlock[property]
          expect(validBlock).to.have.a(property).that.deep.equals expected
          expect(validBlock).to.have.a(property).deep.equal expected
          expect(validBlock).to.have.a(property).that.eqls expected
          expect(validBlock).to.have.a(property).eql expected

        it "should succeed negating an invalid block", ->
          expected = ""
          expect(validBlock).to.have.a(property).that.not.deep.equals expected
          expect(validBlock).to.have.a(property).not.deep.equal expected
          expect(validBlock).to.have.a(property).that.not.eqls expected
          expect(validBlock).to.have.a(property).not.eql expected


        it "should throw an error with an invalid block", ->
          expected = ""

          expect(->
            expect(validBlock).to.have.a(property).that.deep.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).deep.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).that.eqls expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).eql expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          expected = validBlock[property]

          expect(->
            expect(validBlock).to.have.a(property).that.not.deep.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).not.deep.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).that.not.eqls expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(property).not.eql expected
          ).to.throw AssertionError
