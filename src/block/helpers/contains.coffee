module.exports = (chai, utils) ->

  overwrite = require("../../assertion/overwrite")(chai, utils)

  overwriteContainsMethod = (name) ->
    overwrite.chainableMethod name, "that contains"

  overwriteContainsMethod "include"
  overwriteContainsMethod "includes"
  overwriteContainsMethod "contain"
  overwriteContainsMethod "contains"
