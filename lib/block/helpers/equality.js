// Generated by CoffeeScript 1.9.2
(function() {
  module.exports = function(chai, utils) {
    var _overwriteMethod, overwriteDeepEqualMethod, overwriteEqualMethod, overwriteMethod;
    _overwriteMethod = function(preposition, assertion) {
      return function(_super) {
        return function(value) {
          var actual, block, deep, expected, property, propertyName, ref;
          ref = utils.flag(this, "block.propertyName"), block = ref.block, propertyName = ref.propertyName;
          deep = utils.flag(this, "deep");
          property = block[propertyName];
          if (property != null) {
            if (deep) {
              actual = JSON.stringify(property);
              expected = JSON.stringify(value);
            } else {
              actual = property;
              expected = value;
            }
            return this.assert(assertion(actual, expected), "expected block " + block.id + " to have a " + property + " " + preposition + " \#{exp} but got \#{act}", "expected block " + block.id + " to not have a " + property + " " + preposition + " \#{exp} but got \#{act}", actual, expected);
          } else {
            return _super.apply(this, arguments);
          }
        };
      };
    };
    overwriteMethod = function(name, preposition, assertion) {
      var method;
      method = _overwriteMethod(preposition, assertion);
      return chai.Assertion.overwriteMethod(name, method);
    };
    overwriteEqualMethod = function(name) {
      return overwriteMethod(name, "equal to", function(property, value) {
        return property === value;
      });
    };
    overwriteDeepEqualMethod = function(name) {
      return overwriteMethod(name, "deeply equal to", function(property, value) {
        return JSON.stringify(property) === JSON.stringify(value);
      });
    };
    overwriteEqualMethod("equal");
    overwriteEqualMethod("equals");
    overwriteEqualMethod("eq");
    overwriteDeepEqualMethod("eql");
    return overwriteDeepEqualMethod("eqls");
  };

}).call(this);