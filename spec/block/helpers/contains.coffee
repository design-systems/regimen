chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (path, validBlock) ->

  describe "#{path} (contains)", ->

    it "should succeed with a valid block", ->
      value = chai.util.getPathValue path, validBlock
      expected = value.substring 0, value.length - 1

      expect(validBlock).with.a(path).contain expected
      expect(validBlock).with.a(path).that.contains expected
      expect(validBlock).with.a(path).include expected
      expect(validBlock).with.a(path).that.includes expected

    it "should succeed negating an invalid block", ->
      expected = "!@#$%^&*()_+"
      expect(validBlock).to.have.a(path).not.contain expected
      expect(validBlock).to.have.a(path).not.include expected

    it "should throw an error with an invalid block", ->
      expected = "!@#$%^&*()_+"

      expect(->
        expect(validBlock).to.have.a(path).contain expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(path).that.contains expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(path).include expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(path).that.includes expected
      ).to.throw AssertionError

    it "should throw an error negating a valid block", ->
      value = chai.util.getPathValue path, validBlock
      expected = value.substring 0, value.length - 1

      expect(->
        expect(validBlock).to.have.a(path).not.contain expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(path).not.include expected
      ).to.throw AssertionError
