part of utility;

///returns `true` if value is (`null`  or  `false`  or  `''`  or  `0`);
///
///otherwise returns `false`
bool isFalsey(dynamic value) {
  return value == null ||
      (value is bool && value == false) ||
      (value is String && value.trim() == '') ||
      (value is num && value == 0);
}

///returns `true` if `this` is `number` otherwise `false`.
///```dart
///var value = isNumber('123 '); // true
///var value1 = isNumber('12A'); // false
///```
bool isNumber(dynamic s) {
  if (s is num) {
    return true;
  }
  if (s is String) {
    return double.tryParse(s.trim()) != null;
  }
  return false;
}
