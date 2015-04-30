chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (propertyName, validBlock, invalidBlock) ->

  describe "#{propertyName} (equality)", ->

    context "when expecting a block with a #{propertyName}", ->

      context "equals", ->

        it "should succeed with a valid block", ->
          expected = validBlock[propertyName]
          expect(validBlock).to.have.a(propertyName).that.equals expected
          expect(validBlock).to.have.a(propertyName).equal expected
          expect(validBlock).to.have.a(propertyName).eq expected

        it "should throw an error with an invalid block", ->
          expected = ""

          expect(->
            expect(validBlock).to.have.a(propertyName).that.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).eq expected
          ).to.throw AssertionError

        it "should succeed negating an invalid block", ->
          expected = ""
          expect(validBlock).to.have.a(propertyName).that.not.equals expected
          expect(validBlock).to.have.a(propertyName).not.equal expected
          expect(validBlock).to.have.a(propertyName).not.eq expected

        it "should throw an error negating a valid block", ->
          expected = validBlock[propertyName]

          expect(->
            expect(validBlock).to.have.a(propertyName).that.not.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).not.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).not.eq expected
          ).to.throw AssertionError


      context "deep equals", ->
        it "should succeed with a valid block", ->
          expected = validBlock[propertyName]
          expect(validBlock).to.have.a(propertyName).that.deep.equals expected
          expect(validBlock).to.have.a(propertyName).deep.equal expected
          expect(validBlock).to.have.a(propertyName).that.eqls expected
          expect(validBlock).to.have.a(propertyName).eql expected

        it "should succeed negating an invalid block", ->
          expected = ""
          expect(validBlock).to.have.a(propertyName).that.not.deep.equals expected
          expect(validBlock).to.have.a(propertyName).not.deep.equal expected
          expect(validBlock).to.have.a(propertyName).that.not.eqls expected
          expect(validBlock).to.have.a(propertyName).not.eql expected


        it "should throw an error with an invalid block", ->
          expected = ""

          expect(->
            expect(validBlock).to.have.a(propertyName).that.deep.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).deep.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).that.eqls expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).eql expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          expected = validBlock[propertyName]

          expect(->
            expect(validBlock).to.have.a(propertyName).that.not.deep.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).not.deep.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).that.not.eqls expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(propertyName).not.eql expected
          ).to.throw AssertionError
