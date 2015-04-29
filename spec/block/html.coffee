equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"

validBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"
  html: "<div>Some HTML</div>"

invalidBlock =
  id: "88c63e90-803b-4a20-8384-a14b0c4900f3"

property = "html"
equality property, validBlock, invalidBlock
existence property, validBlock, invalidBlock
length property, validBlock, invalidBlock
