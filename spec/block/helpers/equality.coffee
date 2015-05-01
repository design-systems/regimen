chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/regimen"
chai.use grid

module.exports = (path, validBlock, invalidBlock) ->

  describe "#{path} (equality)", ->

    context "when expecting a block with a #{path}", ->

      context "equals", ->

        it "should succeed with a valid block", ->
          expected = chai.util.getPathValue path, validBlock

          expect(validBlock).to.have.a(path).that.equals expected
          expect(validBlock).to.have.a(path).equal expected
          expect(validBlock).to.have.a(path).eq expected

        it "should throw an error with an invalid block", ->
          expected = chai.util.getPathValue path, invalidBlock

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
          expected = chai.util.getPathValue path, invalidBlock

          expect(validBlock).to.have.a(path).that.not.equals expected
          expect(validBlock).to.have.a(path).not.equal expected
          expect(validBlock).to.have.a(path).not.eq expected

        it "should throw an error negating a valid block", ->
          expected = chai.util.getPathValue path, validBlock

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
          expected = chai.util.getPathValue path, validBlock

          expect(validBlock).to.have.a(path).that.deep.equals expected
          expect(validBlock).to.have.a(path).deep.equal expected
          expect(validBlock).to.have.a(path).that.eqls expected
          expect(validBlock).to.have.a(path).eql expected

        it "should succeed negating an invalid block", ->
          expected = chai.util.getPathValue path, invalidBlock

          expect(validBlock).to.have.a(path).that.not.deep.equals expected
          expect(validBlock).to.have.a(path).not.deep.equal expected
          expect(validBlock).to.have.a(path).that.not.eqls expected
          expect(validBlock).to.have.a(path).not.eql expected


        it "should throw an error with an invalid block", ->
          expected = chai.util.getPathValue path, invalidBlock

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
          expected = chai.util.getPathValue path, validBlock

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
