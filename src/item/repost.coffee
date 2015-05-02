_subtypeOf = require "../block/_subtypeOf"

module.exports = (chai, utils) ->
  chai.Assertion.addProperty "repost", ->
    item = @_obj
    {content} = item
    [block] = @_obj.content

    expectedLength = 1
    expectedType = "media"

    try
      _subtypeOf.call @, block, expectedType
      typeIsValid = true
    catch e
      typeIsValid = false

    lengthIsValid = content.length is expectedLength
    itemIsValid = lengthIsValid and typeIsValid

    unless itemIsValid
      unless lengthIsValid
        @assert(
          lengthIsValid
          "expected item #{item.id} content length to be \#{exp} but got \#{act}"
          "expected item #{item.id} content length to not be \#{exp} but got \#{act}"
          expectedLength
          content.length
        )
      else
        _subtypeOf.call @, block, expectedType
