part of utility;

num toNumber(dynamic value, {bool silenced = false}) {
  if (value is num) {
    return value;
  }
  if (value is! String) {
    if (silenced) {
      return null;
    }
    throw Exception('Only String and num allowed.');
  }
  return int.tryParse(value.toString().trim());
}
