chai = require "chai"
{expect, AssertionError} = chai

regimen = require "../../../lib/regimen"
chai.use regimen

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
            expect(validBlock).not.with.a path
          ).to.throw AssertionError

          expect(->
            expect(validBlock).not.with.an path
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


  describe "#{path} (maybe)", ->

    context "when expecting a block with a #{path}", ->

      context "to maybe have a #{path}", ->
        it "should succeed", ->
          expect(validBlock).to.maybe.have.a path
          expect(validBlock).to.maybe.have.an path
          expect(validBlock).with.maybe.a path
          expect(validBlock).with.maybe.an path

        it "should honor subsequent assertions", ->
          expect(validBlock).to.maybe.have.a(path)?.to.exist
          expect(validBlock).to.maybe.have.an(path)?.to.exist
          expect(validBlock).with.maybe.a(path)?.to.exist
          expect(validBlock).with.maybe.an(path)?.to.exist

      context "to maybe not have a #{path}", ->
        it "should succeed", ->
          expect(validBlock).to.maybe.not.have.a path
          expect(validBlock).to.maybe.not.have.an path
          expect(validBlock).not.with.maybe.a path
          expect(validBlock).not.with.maybe.an path

        it "should honor subsequent assertions", ->
          expect(validBlock).to.maybe.not.have.a(path)?.to.exist
          expect(validBlock).to.maybe.not.have.an(path)?.to.exist
          expect(validBlock).not.with.maybe.a(path)?.to.exist
          expect(validBlock).not.with.maybe.an(path)?.to.exist


    context "when expecting a block without a #{path}", ->

      context "to maybe not have a #{path}", ->
        it "should succeed", ->
          expect(invalidBlock).to.maybe.not.have.a path
          expect(invalidBlock).to.maybe.not.have.an path
          expect(invalidBlock).not.with.maybe.a path
          expect(invalidBlock).not.with.maybe.an path

        it "should ignore subsequent assertions", ->
          expect(invalidBlock).to.maybe.not.have.a(path)?.to.equal false
          expect(invalidBlock).to.maybe.not.have.an(path)?.to.equal false
          expect(invalidBlock).not.with.maybe.a(path)?.to.equal false
          expect(invalidBlock).not.with.maybe.an(path)?.to.equal false

      context "to maybe have a #{path}", ->
        it "should succeed", ->
          expect(invalidBlock).to.maybe.have.a path
          expect(invalidBlock).to.maybe.have.an path
          expect(invalidBlock).with.maybe.a path
          expect(invalidBlock).with.maybe.an path

        it "should ignore subsequent assertions", ->
          expect(invalidBlock).to.maybe.have.a(path)?.to.equal false
          expect(invalidBlock).to.maybe.have.an(path)?.to.equal false
          expect(invalidBlock).with.maybe.a(path)?.to.equal false
          expect(invalidBlock).with.maybe.an(path)?.to.equal false
