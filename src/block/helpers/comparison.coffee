module.exports = (chai, utils) ->
  overwrite = require("../../assertion/overwrite")(chai, utils)

  overwriteLeastMethod = (name) ->
    overwrite.method name, "at least"

  overwriteMostMethod = (name) ->
    overwrite.method name, "at most"

  overwriteAboveMethod = (name) ->
    overwrite.method name, "above"

  overwriteBelowMethod = (name) ->
    overwrite.method name, "below"

  overwriteLeastMethod "least"
  overwriteLeastMethod "gte"

  overwriteMostMethod "most"
  overwriteMostMethod "lte"

  overwriteAboveMethod "above"
  overwriteAboveMethod "gt"
  overwriteAboveMethod "greaterThan"

  overwriteBelowMethod "below"
  overwriteBelowMethod "lt"
  overwriteBelowMethod "lessThan"
