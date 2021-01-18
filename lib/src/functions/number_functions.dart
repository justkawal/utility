part of utility;

///As operator `>>>` is not available in dart, So `zeroFillRightShift` function helps to mimics the working of `>>>`.
///```dart
///// var t = 20 >>> 3;
///var t = zeroFillRightShift(20, 3); // 6
///
///// Thus above function helps to provide operation of `>>>`
///
///20 >>> 3 = 6
///var value = 20.zeroFillRightShift(3); // value = 6
///```
int zeroFillRightShift(int number, int amount) {
  return (number & 0xffffffff) >> amount;
}

///Converts `value` to number
///```dart
///var value = toNumber('2604 '); // 2604
///var value1 = toNumber('  26.04 '); // 26.04
///var value1 = toNumber('  ABC.04 '); // null
///var value1 = toNumber('ABC.04 ', showException: true); // null
///```
num? toNumber(dynamic value, {bool showException = false}) {
  if (value == null) {
    return null;
  }
  if (value is num) {
    return value;
  }
  if (value is! String) {
    if (showException) {
      throw Exception('Only String and num allowed.');
    }
    return null;
  }
  return double.tryParse(value.toString().trim());
}

///It returns `xor` operation
///```dart
///// 20 ^ 3 = 23
///var value = xor(20, 3); // value = 23
///```
int xor(int val1, int val2) {
  return val1 ^ val2;
}

///It returns `quotient` as integer on divison.
///```dart
///// ( In Python ) -> [20 // 10 = 2]
///// ( In Dart )   -> [20 / 10 = 2.0] // ouch
///
///// But we need 2 as result.
///var value = divide(20, 10);       // value = 2
///var value = divide(20, 10.0);     // value = 2
///var value = divide(20.0, 10);   // value = 2
///var value = divide(20.0, 10.0); // value = 2
///var dividend = 20;
///var divisor = 10;
///var value = divide(dividend, divisor); // value = 2
///```
int divide(num dividend, num divisor) {
  return dividend ~/ divisor;
}
