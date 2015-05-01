module.exports = (chai, utils) ->
  overwrite = require("../../assertion/overwrite")(chai, utils)

  overwrite.chainableMethod "length", "with length of", "length"
