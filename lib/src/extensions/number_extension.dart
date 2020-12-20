part of utility;

extension UtilityNumber on int {
  ///
  /// It returns `zeroFillRightShift`, sign: `>>>`
  ///
  /// ````dart
  /// // 20 >>> 3 = 6
  /// var value = 20.zeroFillRightShift(3); // value = 6
  ///````
  ///
  int zeroFillRightShift(int amount) {
    if (this == null) return null;
    return (this & 0xffffffff) >> amount;
  }

  ///
  /// It returns `xor` operation
  ///
  /// ````dart
  /// // 20 ^ 3 = 23
  /// var value = 20.xor(3); // value = 23
  ///````
  ///
  int xor(int val) => this ^ val;

  ///
  /// It returns `and` operation
  ///
  /// ````dart
  /// // 20 & 3 = 0
  /// var value = 20.and(3); // value = 0
  ///````
  ///
  int and(int val) => this & val;

  ///
  /// It returns `or` operation
  ///
  /// ````dart
  /// // 20 | 3 = 23
  /// var value = 20.or(3); // value = 23
  ///````
  ///
  int or(int val) => this | val;
}
