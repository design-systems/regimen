chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (path, validBlock, invalidBlock) ->

  describe "#{path} (equality)", ->

    context "when expecting a block with a #{path}", ->

      context "equals", ->

        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(validBlock).to.have.a(path).that.equals expected
          expect(validBlock).to.have.a(path).equal expected
          expect(validBlock).to.have.a(path).eq expected

        it "should throw an error with an invalid block", ->
          expected = ""

          expect(->
            expect(validBlock).to.have.a(path).that.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).eq expected
          ).to.throw AssertionError

        it "should succeed negating an invalid block", ->
          expected = ""

          expect(validBlock).to.have.a(path).that.not.equals expected
          expect(validBlock).to.have.a(path).not.equal expected
          expect(validBlock).to.have.a(path).not.eq expected

        it "should throw an error negating a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(->
            expect(validBlock).to.have.a(path).that.not.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).not.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).not.eq expected
          ).to.throw AssertionError


      context "deep equals", ->
        it "should succeed with a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(validBlock).to.have.a(path).that.deep.equals expected
          expect(validBlock).to.have.a(path).deep.equal expected
          expect(validBlock).to.have.a(path).that.eqls expected
          expect(validBlock).to.have.a(path).eql expected

        it "should succeed negating an invalid block", ->
          expected = ""

          expect(validBlock).to.have.a(path).that.not.deep.equals expected
          expect(validBlock).to.have.a(path).not.deep.equal expected
          expect(validBlock).to.have.a(path).that.not.eqls expected
          expect(validBlock).to.have.a(path).not.eql expected


        it "should throw an error with an invalid block", ->
          expected = ""

          expect(->
            expect(validBlock).to.have.a(path).that.deep.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).deep.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).that.eqls expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).eql expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          value = chai.util.getPathValue path, validBlock
          expected = value

          expect(->
            expect(validBlock).to.have.a(path).that.not.deep.equals expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).not.deep.equal expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).that.not.eqls expected
          ).to.throw AssertionError

          expect(->
            expect(validBlock).to.have.a(path).not.eql expected
          ).to.throw AssertionError
