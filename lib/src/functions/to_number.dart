part of utility;

///Converts `value` to number
///```dart
///var value = toNumber('2604 '); // 2604
///var value1 = toNumber('  26.04 '); // 26.04
///```
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
