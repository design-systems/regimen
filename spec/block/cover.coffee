equality = require "./helpers/equality"
existence = require "./helpers/existence"

validBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
  cover:
    src: "cover.jpg"
    width: 1600
    height: 900

invalidBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"

property = "cover"
equality property, validBlock, invalidBlock
existence property, validBlock, invalidBlock
