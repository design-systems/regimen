chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../../src/chai-grid"
chai.use grid

module.exports = (propertyName, validBlock, invalidBlock, keyName) ->

  targetName = propertyName
  targetName = "#{propertyName} #{keyName}" if keyName?

  describe "#{targetName} (length)", ->

    context "when expecting a block with a #{targetName}", ->

      context "length", ->

        it "should succeed with a valid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          assertion.with.length expected
          assertion.length expected

        it "should succeed negating an invalid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length - 1

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          assertion.not.with.length expected
          assertion.not.length expected

        it "should throw an error with an invalid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length - 1

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          expect(->
            assertion.with.length expected
          ).to.throw AssertionError

          expect(->
            assertion.length expected
          ).to.throw AssertionError

        it "should throw an error negating a invalid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          expect(->
            assertion.not.with.length expected
          ).to.throw AssertionError

          expect(->
            assertion.not.length expected
          ).to.throw AssertionError


      context "above", ->

        it "should succeed with a valid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length - 1

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          assertion.with.length.above expected
          assertion.with.length.gt expected
          assertion.with.length.greaterThan expected

        it "should succeed negating an invalid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          assertion.with.length.not.above expected
          assertion.with.length.not.gt expected
          assertion.with.length.not.greaterThan expected

        it "should throw an error with an invalid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          expect(->
            assertion.with.length.above expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.gt expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.greaterThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length - 1

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          expect(->
            assertion.with.length.not.above expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.not.gt expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.not.greaterThan expected
          ).to.throw AssertionError


      context "below", ->

        it "should succeed with a valid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length + 1

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          assertion.with.length.below expected
          assertion.with.length.lt expected
          assertion.with.length.lessThan expected

        it "should succeed negating an invalid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          assertion.with.length.not.below expected
          assertion.with.length.not.lt expected
          assertion.with.length.not.lessThan expected

        it "should throw an error with an invalid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          expect(->
            assertion.with.length.below expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.lt expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.lessThan expected
          ).to.throw AssertionError

        it "should throw an error negating a valid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length + 1

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          expect(->
            assertion.with.length.not.below expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.not.lt expected
          ).to.throw AssertionError

          expect(->
            assertion.with.length.not.lessThan expected
          ).to.throw AssertionError


      context "within", ->
        it "should succeed with a valid block", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          # FIXME expect(validBlock).to.have.a(propertyName).with.length.within 0, expected
          assertion.with.length.gte(0).and.lte(expected)

        it "should fail with an invalid length", ->
          target = validBlock[propertyName]
          target = target[keyName] if keyName?
          expected = target.length + 1

          assertion = expect(validBlock).with.a propertyName
          assertion = assertion[keyName] if keyName?

          # FIXME
          # # expect(->
          # #  assertion.with.length.within 0, expected
          # # )

          expect(->
            assertion.with.length.gte(0).and.lte(expected)
          )
