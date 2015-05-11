contains = require "./helpers/contains"
equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"

validBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
  item: "097d28bc-97bb-47e9-8d05-b7ea05deba27"
  description: "Some description."

invalidBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
  item: "097d28bc-97bb-47e9-8d05-b7ea05deba27"

property = "description"
contains property, validBlock
equality property, validBlock, invalidBlock
existence property, validBlock, invalidBlock
length property, validBlock
