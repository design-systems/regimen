module.exports = (chai, utils) ->
  overwrite = require("../../assertion/overwrite")(chai, utils)

  overwriteEqualMethod = (name) ->
    overwrite.method name, "equal to"

  overwriteDeepEqualMethod = (name) ->
    overwrite.method name, "deeply equal to"

  overwriteEqualMethod "equal"
  overwriteEqualMethod "equals"
  overwriteEqualMethod "eq"

  overwriteDeepEqualMethod "eql"
  overwriteDeepEqualMethod "eqls"
