contains = require "./helpers/contains"
equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"

validBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
  title: "Some Title"

invalidBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"

property = "title"
contains property, validBlock
equality property, validBlock, invalidBlock
existence property, validBlock, invalidBlock
length property, validBlock
