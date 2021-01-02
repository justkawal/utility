part of utility;

/// Converts value to number
///
num toNumber(dynamic value, {bool showException = false}) {
  if (value == null) {
    return null;
  }
  if (value is num) {
    return value;
  }
  if (value is! String) {
    if (showException) {
      return null;
    }
    throw Exception('Only String and num allowed.');
  }
  return double.tryParse(value.toString().trim());
}
