chai = require "chai"
{expect, AssertionError} = chai

grid = require "../../src/chai-grid"
chai.use grid

describe "repost", ->

  repost =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    content: [
      id: "88c63e90-803b-4a20-8384-a14b0c4900f2"
      type: "video"
    ]

  post =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    content: [
      id: "88c63e90-803b-4a20-8384-a14b0c4900f2"
      type: "text"
    ,
      id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
      type: "article"
    ]

  empty =
    id: "88c63e90-803b-4a20-8384-a14b0c4900f1"
    content: []


  it "should succeed when expecting a repost to be a repost", ->
    expect(repost).to.be.a.repost

  it "should succeed when expecting a post to not be a repost", ->
    expect(post).to.not.be.a.repost

  it "should succeed when expecting an item with empty content to not be a repost", ->
    expect(empty).to.not.be.a.repost

  it "should throw an error when expecting a post to be a repost", ->
    exercise = -> expect(post).to.be.a.repost
    expect(exercise).to.throw AssertionError

  it "should throw an error when expecting a repost to not be a repost", ->
    exercise = -> expect(repost).to.not.be.a.repost
    expect(exercise).to.throw AssertionError

  it "should throw an error with expecting an item with empty content be a repost", ->
    exercise = -> expect(empty).to.be.a.repost
    expect(exercise).to.throw AssertionError
