part of utility;

///
///`>>>` is called zero fill right shift.
/// As operator `>>>` is not available in dart, So [zeroFillRightShift] function helps to mimic the working of `>>>`
///````dart
/// // var t = 0 >>> 1;
/// var t = zeroFillRightShift(0, 1);
///
/// // Thus above function helps to provide operation of `>>>`
///````
int zeroFillRightShift(int n, int t) {
  return n.zeroFillRightShift(t);
}
