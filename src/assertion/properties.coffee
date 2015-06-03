module.exports = (chai, utils) ->

  chai.Assertion.addProperty "avatar", ->
    block = @_obj

    if block.author?
      utils.flag @, "block.pathValue", "author.avatar"

      @assert(
        block.author.avatar?
        "expected block #{block.id} author to have an avatar"
        "expected block #{block.id} author to not have an avatar"
      )


  chai.Assertion.addProperty "description", ->
    block = @_obj

    utils.flag @, "block.pathValue", "description"

    @assert(
      block.description?
      "expected block #{block.id} to have a description"
      "expected block #{block.id} to not have a description"
    )


  chai.Assertion.addProperty "domain", ->
    block = @_obj

    if block.publisher?
      utils.flag @, "block.pathValue", "publisher.domain"

      @assert(
        block.publisher.domain?
        "expected block #{block.id} publisher to have a domain"
        "expected block #{block.id} publisher to not have a domain"
      )


  chai.Assertion.addProperty "favicon", ->
    block = @_obj

    if block.publisher?
      utils.flag @, "block.pathValue", "publisher.favicon"

      @assert(
        block.publisher.favicon?
        "expected block #{block.id} publisher to have a favicon"
        "expected block #{block.id} publisher to not have a favicon"
      )


  chai.Assertion.addProperty "height", ->
    block = @_obj

    if block.cover?
      utils.flag @, "block.pathValue", "cover.height"

      @assert(
        block.cover.height?
        "expected block #{block.id} cover to have a height"
        "expected block #{block.id} cover to not have a height"
      )


  chai.Assertion.addProperty "html", ->
    block = @_obj

    utils.flag @, "block.pathValue", "html"

    @assert(
      block.html?
      "expected block #{block.id} to have a html"
      "expected block #{block.id} to not have a html"
    )


  chai.Assertion.addProperty "maybe", ->
    utils.flag @, "block.maybe", true


  chai.Assertion.addProperty "name", ->
    block = @_obj

    if block.author?
      utils.flag @, "block.pathValue", "author.name"

      @assert(
        block.author.name?
        "expected block #{block.id} author to have a name"
        "expected block #{block.id} author to not have a name"
      )

    else if block.publisher?
      utils.flag @, "block.pathValue", "publisher.name"

      @assert(
        block.publisher.name?
        "expected block #{block.id} publisher to have a name"
        "expected block #{block.id} publisher to not have a name"
      )


  chai.Assertion.addProperty "src", ->
    block = @_obj

    if block.cover?
      utils.flag @, "block.pathValue", "cover.src"

      @assert(
        block.cover.src?
        "expected block #{block.id} cover to have a src"
        "expected block #{block.id} cover to not have a src"
      )


  chai.Assertion.addProperty "title", ->
    block = @_obj

    utils.flag @, "block.pathValue", "title"

    @assert(
      block.title?
      "expected block #{block.id} to have a title"
      "expected block #{block.id} to not have a title"
    )



  chai.Assertion.addProperty "subtitle", ->
    block = @_obj

    utils.flag @, "block.pathValue", "subtitle"

    @assert(
      block.subtitle?
      "expected block #{block.id} to have a subtitle"
      "expected block #{block.id} to not have a subtitle"
    )



  chai.Assertion.addProperty "url", ->
    block = @_obj

    if block.author?
      utils.flag @, "block.pathValue", "author.url"

      @assert(
        block.author.url?
        "expected block #{block.id} author to have a url"
        "expected block #{block.id} author to not have a url"
      )

    else if block.publisher?
      utils.flag @, "block.pathValue", "publisher.url"

      @assert(
        block.publisher.url?
        "expected block #{block.id} publisher to have a url"
        "expected block #{block.id} publisher to not have a url"
      )


  chai.Assertion.addProperty "width", ->
    block = @_obj

    if block.cover?
      utils.flag @, "block.pathValue", "cover.width"

      @assert(
        block.cover.width?
        "expected block #{block.id} cover to have a width"
        "expected block #{block.id} cover to not have a width"
      )
