part of utility;

extension UtilityString on String {
  /// returns `true` is `s` is number otherwise `false`
  bool get isNumber => double.tryParse('$this') ?? false;

  /// returns `true` if the string is `binary`, other-wise `false`
  bool get isBinary => regExpIsBinary.hasMatch('$this');

  /// returns `true` if the string is `decimal`, other-wise `false`
  bool get isDecimal => this?.isNumber ?? false;

  /// returns `true` if the string is `octal`, other-wise `false`
  bool get isOctal => regExpIsOctal.hasMatch('$this');

  /// returns `true` if the string is `good hex`, other-wise `false`
  bool get isHex => !regExpIsBadHex.hasMatch('$this');

  ///
  /// Converts string from `Latin-1` to normal `basic latin letters`
  /// ````dart
  /// 'déjà vu'.deburr; // deja vu
  /// ````
  String get deburr {
    return this?.replaceAllMapped(reLatin, (match) {
      var value = '';
      match[0].toString().split('').forEach((matchLetter) =>
          value += '${deburredLetters[matchLetter] ?? matchLetter}');
      return value;
    })?.replaceAll(reComboMark, '');
  }

  unicodeWords() {
    reUnicodeWord.allMatches(this).toList().map((e) => e.toString());
  }
}
