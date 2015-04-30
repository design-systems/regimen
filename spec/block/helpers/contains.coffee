chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (propertyName, keyName, validBlock, invalidBlock) ->

  describe "#{propertyName} #{keyName} (contains)", ->

    it "should succeed with a valid block", ->
      property = validBlock[propertyName]
      value = property[keyName]
      expected = value.substring 0, value.length - 1

      expect(validBlock).with.a(propertyName).contain expected
      expect(validBlock).with.a(propertyName).that.contains expected
      expect(validBlock).with.a(propertyName).include expected
      expect(validBlock).with.a(propertyName).that.includes expected

    it "should succeed negating an invalid block", ->
      expected = "!@#$%^&*()_+"
      expect(validBlock).to.have.a(propertyName).not.contain expected
      expect(validBlock).to.have.a(propertyName).not.include expected

    it "should throw an error with an invalid block", ->
      expected = "!@#$%^&*()_+"

      expect(->
        expect(validBlock).to.have.a(propertyName).contain expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(propertyName).that.contains expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(propertyName).include expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(propertyName).that.includes expected
      ).to.throw AssertionError

    it "should throw an error negating a valid block", ->
      property = validBlock[propertyName]
      value = property[keyName]
      expected = value.substring 0, value.length - 1

      expect(->
        expect(validBlock).to.have.a(propertyName).not.contain expected
      ).to.throw AssertionError

      expect(->
        expect(validBlock).to.have.a(propertyName).not.include expected
      ).to.throw AssertionError
