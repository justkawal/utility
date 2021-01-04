part of utility;

extension UtilityString on String {
  ///Creates a slice of `string` from `start` up to, but not including, `end`.
  ///```dart
  ///var string = 'justkawal';
  ///
  ///// It slices the string and returns modified string
  ///string.slice(2); // string = '';
  ///```
  String slice(int start, [int end]) {
    var length = this?.length ?? 0;
    if (length <= 0) {
      return '';
    }
    start ??= 0;
    end ??= length;

    if (start < 0) {
      start = -start > length ? 0 : (length + start);
    }
    if (end > length) {
      end = length;
    }
    if (end < 0) {
      end += length;
    }
    length = start > end ? 0 : (end - start).zeroFillRightShift(0);
    start = start.zeroFillRightShift(0);

    var index = -1;
    var result = '';
    while (++index < length) {
      result += this[index + start];
    }
    return result;
  }

  /// Trims the value and then converts it to number
  ///```dart
  ///
  ///'2604 '.toNumber; // 2604
  ///'  26.04 '.toNumber; // 26.04
  ///```
  num get toNumber {
    if (this == null || /* this. */ trim().isEmpty) {
      return null;
    }
    return double.tryParse(/* this. */ trim());
  }

  /// Counts the number of occurrences of value.
  /// ```dart
  ///
  /// 'justkawal'.count('a'); // 2
  /// 'justkawal'.count('just'); // 1
  /// 'justkawal'.count('flutter'); // 0
  /// ```
  int count(String value, [bool caseSensitive = true]) {
    if (this == null || value == null || value.isEmpty) {
      return 0;
    }
    //caseSensitive ??= true;
    return /* this. */ length -
        (caseSensitive
                ? /* this. */ replaceAll(value, '')
                : /* this. */ toLowerCase().replaceAll(value.toLowerCase(), ''))
            .length;
  }

  /// returns `true`, if the `string` is `number` other-wise `false`
  /// ```dart
  ///
  /// '123'.isNumber; // true
  /// 'justkawal'.isNumber; // false
  /// ```
  bool get isNumber {
    return double.tryParse(this) != null;
  }

  /// returns `true` if the `string` is `binary`, other-wise `false`
  /// ```dart
  ///
  /// '1010'.isBinary; // true
  /// 'justkawal'.isBinary; // false
  /// ```
  bool get isBinary {
    return regExpIsBinary.hasMatch(this);
  }

  /// returns `true` if the `string` is `decimal`, other-wise `false`
  /// ```dart
  ///
  /// '123'.isDecimal; // true
  /// 'justkawal'.isDecimal; // false
  /// ```
  bool get isDecimal {
    return this?.isNumber ?? false;
  }

  /// returns `true` if the `string` is `octal`, other-wise `false`
  /// ```dart
  ///
  /// '123'.isOctal; // true
  /// 'justkawal'.isOctal; // false
  /// ```
  bool get isOctal {
    return regExpIsOctal.hasMatch(this);
  }

  /// returns `true` if the `string` is `good hex`, other-wise `false`
  /// ```dart
  ///
  /// '123'.isHex; // true
  /// 'justkawal'.isHex; // false
  /// ```
  bool get isHex {
    return !regExpIsBadHex.hasMatch(this);
  }

  /// Converts string from `Latin-1` to normal `basic latin letters`
  /// ```dart
  /// 'hey kàwàl'.deburr; // hey kawal
  /// ```
  String get deburr {
    return this?.replaceAllMapped(reLatin, (match) {
      var value = '', word = '${match[0] ?? ""}';
      for (var index = 0; index < word.length ?? 0; index++) {
        value += '${deburredLetters[word[index]] ?? word[index]}';
      }
      return value;
    })?.replaceAll(reComboMark, '');
  }

  /// Returns list of `unicode words` from the string
  /// ```dart
  /// 'hey kàwàl'.unicodeWords; // [kàwàl]
  /// ```
  List<String> get unicodeWords {
    return _unicodeAsciiWords();
  }

  /// Returns list of `ascii words` from the string
  /// ```dart
  /// 'hey kàwàl'.asciiWords; // [hey]
  /// ```
  List<String> get asciiWords {
    return _unicodeAsciiWords(false);
  }

  /// returns `list of unicodeWords` when `isUnicode: true` other-wise returns `list of asciiWords`
  List<String> _unicodeAsciiWords([bool isUnicode = true]) {
    var list = <String>[];
    (isUnicode ? reUnicodeWord : reAsciiWord).allMatches(this).forEach((match) {
      if (match[0].hasUnicodeWord == isUnicode) {
        list.add(match[0]);
      }
    });
    return list;
  }

  /// Returns `true` if string contains any occurence of `unicode word` other-wise `false`
  /// ```dart
  /// 'hey kàwàl'.hasUnicodeWord; // true
  /// 'hey'.hasUnicodeWord;      // false
  /// ```
  bool get hasUnicodeWord {
    return reHasUnicodeWord.hasMatch(this);
  }

  /// Returns `true` if string contains `unicode` other-wise `false`
  bool get hasUnicode {
    return reHasUnicode.hasMatch(this);
  }

  /// Converts the first character of string to `upper case` and the remaining to `lower case`.
  /// ```dart
  /// 'justkawal'.capitalize; // Justkawal
  /// 'JUSTKAWAL'.capitalize; // Justkawal
  /// ```
  String get capitalize {
    var result;
    if (this != null && /* this. */ isNotEmpty) {
      result = this[0].toUpperCase();
      if (/* this. */ length > 1) {
        result += /* this. */ substring(1).toLowerCase();
      }
    }
    return result;
  }

  /// Converts the first character of string to lower case.
  /// ```dart
  /// 'Justkawal'.lowerFirst; // justkawal
  /// 'JUSTKAWAL'.lowerFirst; // jUSTKAWAL
  /// ```
  String get lowerFirst {
    var result;
    if (this != null && /* this. */ isNotEmpty) {
      result = this[0].toLowerCase();
      if (/* this. */ length > 1) {
        result += /* this. */ substring(1);
      }
    }
    return result;
  }

  /// Converts the first character of string to `upper case`.
  /// ```dart
  /// 'justkawal'.upperFirst; // Justkawal
  /// 'jUSTKAWAL'.upperFirst; // JUSTKAWAL
  /// ```
  String get upperFirst {
    var result = '';
    if (this != null && /* this. */ isNotEmpty) {
      result = this[0].toUpperCase();
      if (/* this. */ length > 1) {
        result += /* this. */ substring(1);
      }
    }
    return result;
  }

  /// returns `list of words`
  /// ```dart
  /// 'kàwàl vu'.words; // ['kàwàl', 'vu']
  /// ```
  List<String> words([RegExp pattern]) {
    if (pattern == null) {
      return reAsciiWord.hasMatch(this)
          ? /* this. */ asciiWords
          : /* this. */ unicodeWords;
    }
    return pattern.allMatches(this).map((match) => '${match[0]}').toList();
  }

  /// --------------------- Cases Start ---------------------

  /// Converts the string to `camelCase`.
  /// ```dart
  /// '___just__kawal__'.camelCase; // justKawal
  /// '  just  Kawal  '.camelCase; // justKawal
  /// '-----just--Kawal--'.camelCase; // justKawal
  /// ```
  String get camelCase {
    var wordList = /* this. */ words();
    var leftSide = wordList.first.toLowerCase();
    var rightSide =
        wordList.skip(1).reduce((value, element) => value + element.capitalize);
    return leftSide + rightSide;
  }

  /// Converts the string to `kebabCase`.
  /// ```dart
  /// '___hello__world__'.kebabCase(); // hello-world
  /// '  hello  World  '.kebabCase(); // hello-world
  /// '-----hello--world--'.kebabCase(); // hello-world
  /// ```
  String kebabCase({String separator = '-'}) {
    return _reuseCase(separator ?? '-');
  }

  /// Converts the string to `lowerCase`.
  /// ```dart
  /// '___hello__world__'.lowerCase(); // hello world
  /// '  hello  World  '.lowerCase(); // hello world
  /// '-----hello--world--'.lowerCase(); // hello world
  /// ```
  String lowerCase({String separator = ' '}) {
    return _reuseCase(separator ?? ' ');
  }

  /// Converts the string to `snakeCase`.
  /// ```dart
  /// '___hello__world__'.snakeCase(); // hello_world
  /// '  helloWorld  '.snakeCase(); // hello_world
  /// '-----hello--world--'.snakeCase(); // hello_world
  /// ```
  String snakeCase({String separator = '_'}) {
    return _reuseCase(separator ?? '_');
  }

  /// A helper function for reusing the same functionality of `snakeCase`, `lowerCase` and `kebabCase`.
  String _reuseCase(String separator) {
    return /* this
        . */
        words().map((word) => word.toLowerCase()).toList().join(separator);
  }

  /// Converts the string to `nameCase`.
  /// ```dart
  /// '___kaWaljeet__sInGH__'.nameCase(); // Kawaljeet Singh
  /// '  justKawal  '.nameCase(); // Just Kawal
  /// '-----kawaljeet--singh--'.nameCase(); // Kawaljeet Singh
  /// ```
  String nameCase({String separator = ' '}) {
    return /* this
        . */
        words().map((word) => word.capitalize).toList().join(separator ?? ' ');
  }

  // --------------------- Cases End ---------------------

  /// returns `repeated string`, `n` number of times
  /// ```dart
  /// 'justkawal'.repeat(1); // justkawal
  /// '123'.repeat(2); // 123123
  /// '1'.repeat(5); // 11111
  /// ```
  String repeat([int n = 1]) {
    if ((this ?? true) || n < 1) {
      return '';
    }
    var result = '', string = this;
    do {
      if ((n % 2) > 0) {
        result += string;
      }
      n = (n / 2).floor();
      if (n > 0) {
        string += string;
      }
    } while (n > 0);
    return result;
  }

  /// Pads the string on the left and right sides if it's shorter than `length`.
  /// Padding characters will be truncated if they can't be evenly divided by `length`.
  ///```dart
  /// var pad1 = 'abc'.pad(8); // '  abc   '
  ///
  /// var pad2 = 'abc'.pad(8, '=_'); // '=_abc=_='
  ///
  /// var pad3 = 'abc'.pad(3); // 'abc'
  ///```
  String pad(int length, [String chars = ' ']) {
    var strLength = length != 0 ? /* this. */ length : 0;
    if (length == 0 || strLength >= length) {
      return this;
    }
    var mid = (length - strLength) / 2;
    return (_createPadding((mid.floor()), chars) +
        this +
        _createPadding((mid.floor()), chars));
  }

  // private function for internal usage
  String _createPadding(int length, String chars) {
    if ((chars ?? '') == '') {
      chars = ' ';
    }
    var charsLength = chars.length;
    if (charsLength < 2) {
      return charsLength > 0 ? chars.repeat(length) : chars;
    }
    var result = chars.repeat((length / chars.length).ceil());
    return chars.hasUnicode
        ? result._stringToList._castSlice(0, length).join('')
        : result.slice(0, length);
  }

  // private function for internal usage
  List<String> get _stringToList {
    return /* this. */ hasUnicode
        ? /* this. */ _unicodeToList
        : /* this. */ _asciiToList;
  }

  // private function for internal usage
  List<String> get _asciiToList {
    return /* this. */ split('');
  }

  // private function for internal usage
  List<String> get _unicodeToList {
    return reUnicode
        .allMatches(this)
        .map((match) => match[0].toString())
        .toList();
  }
/* 
  _parseHex(String nakedHex) {
    var isShort = nakedHex.length == 3 || nakedHex.length == 4;

    if (isShort) {
      var alpha = '${nakedHex.slice(3, 4)}${nakedHex.slice(3, 4)}';
      return {
        'r': '${nakedHex.slice(0, 1)}${nakedHex.slice(0, 1)}',
        'g': '${nakedHex.slice(1, 2)}${nakedHex.slice(1, 2)}',
        'b': '${nakedHex.slice(2, 3)}${nakedHex.slice(2, 3)}',
        'a': alpha.isEmpty ? 'ff' : alpha
      };
    } else {
      var alpha = '${nakedHex.slice(6, 8)}';
      return {
        'r': nakedHex.slice(0, 2),
        'g': nakedHex.slice(2, 4),
        'b': nakedHex.slice(4, 6),
        'a': alpha.isEmpty ? 'ff' : alpha
      };
    } */
  /* 

  const twoDigitHexR = isShort ? `${nakedHex.slice(0, 1)}${nakedHex.slice(0, 1)}` : nakedHex.slice(0, 2);
  const twoDigitHexG = isShort ? `${nakedHex.slice(1, 2)}${nakedHex.slice(1, 2)}` : nakedHex.slice(2, 4);
  const twoDigitHexB = isShort ? `${nakedHex.slice(2, 3)}${nakedHex.slice(2, 3)}` : nakedHex.slice(4, 6);
  const twoDigitHexA = ((isShort ? `${nakedHex.slice(3, 4)}${nakedHex.slice(3, 4)}` : nakedHex.slice(6, 8)) || 'ff'); */

  // const numericA = +((parseInt(a, 16) / 255).toFixed(2));
/* 
  return {
    r: twoDigitHexR,
    g: twoDigitHexG,
    b: twoDigitHexB,
    a: twoDigitHexA,
  };
  } */
/* 
  void hexToRGBA(int alpha) {
    var hashlessHex = _removeHash(this);
    var hexObject = _parseHex(hashlessHex);
    var decimalObject = hexesToDecimals(hexObject);
  }

  String _removeHash(String hex) {
    if (hex != null && hex.isNotEmpty && hex[0] == '#') {
      hex.slice(1);
    }
    return hex;
  } */
}
