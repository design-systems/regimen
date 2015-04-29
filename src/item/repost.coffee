_subtypeOf = require "../block/_subtypeOf"

module.exports = (chai, utils) ->
  chai.Assertion.addProperty "repost", ->
    item = @_obj
    {content} = item


    ### Assert content length ###

    expectedLength = 1

    @assert(
      content.length is expectedLength
      "expected item #{item.id} content length to be \#{exp} but got \#{act}"
      "expected item #{item.id} content length to not be \#{exp} but got \#{act}"
      expectedLength
      content.length
    )


    ### Assert block type ###

    block = @_obj.content[0]
    expectedType = "media"
    _subtypeOf.call @, block, expectedType
