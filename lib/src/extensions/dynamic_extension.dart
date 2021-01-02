part of utility;

extension UtilityDynamic on dynamic {
  /// Converts value to number
  ///
  num toNumber({bool showException = false}) {
    if (this == null) {
      return null;
    }
    if (this is num) {
      return this;
    }
    if (this is! String) {
      if (showException) {
        return null;
      }
      throw Exception('Only String and num allowed.');
    }
    return double.tryParse(this.toString().trim());
  }
}
