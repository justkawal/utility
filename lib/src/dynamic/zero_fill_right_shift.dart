part of utility;

/// As operator `>>>` is not available in dart, So `zeroFillRightShift` function helps to mimics the working of `>>>`.
///````dart
/// // var t = 20 >>> 3;
/// var t = zeroFillRightShift(20, 3); // 6
///
/// // Thus above function helps to provide operation of `>>>`
///
/// 20 >>> 3 = 6
/// var value = 20.zeroFillRightShift(3); // value = 6
///````
int zeroFillRightShift(int number, int amount) {
  return number.zeroFillRightShift(amount);
}
