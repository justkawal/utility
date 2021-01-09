part of utility;

///returns `true` if `this` is `number` otherwise `false`.
///```dart
///var value = isNumber('123 '); // true
///var value1 = isNumber('12A'); // false
///```
bool isNumber(dynamic s) {
  if (s == null) {
    return false;
  }
  if (s is num) {
    return true;
  }
  return double.tryParse('$s'.trim()) != null;
}
