part of utility;

// ignore_for_file: unnecessary_this
extension UtilityString on String {
  ///
  ///Creates a slice of `string` from `start` up to, but not including, `end`.
  ///
  ///````dart
  ///var string = 'justkawal;
  ///
  ///// It slices the string and returns modified string
  ///string.slice(2); // string = '';
  ///````
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
    length = start > end ? 0 : zeroFillRightShift((end - start), 0);
    start = start.zeroFillRightShift(0);

    var index = -1;
    var result = '';
    while (++index < length) {
      result += this[index + start];
    }
    return result;
  }

  ///
  /// returns `true` is `s` is number otherwise `false`
  /// ````dart
  ///
  /// '123'.isNumber; // true
  /// '10A'.isNumber; // false
  /// ````
  bool get isNumber => double.tryParse('$this') ?? false;

  /// returns `true` if the string is `binary`, other-wise `false`
  /// ````dart
  ///
  /// '1010'.isBinary; // true
  /// '10A'.isBinary; // false
  /// ````
  bool get isBinary => regExpIsBinary.hasMatch('$this');

  /// returns `true` if the string is `decimal`, other-wise `false`
  /// ````dart
  ///
  /// '123'.isDecimal; // true
  /// '10A'.isDecimal; // false
  /// ````
  bool get isDecimal => this?.isNumber ?? false;

  /// returns `true` if the string is `octal`, other-wise `false`
  /// ````dart
  ///
  /// '123'.isOctal; // true
  /// '10A'.isOctal; // false
  /// ````
  bool get isOctal => regExpIsOctal.hasMatch('$this');

  /// returns `true` if the string is `good hex`, other-wise `false`
  /// ````dart
  ///
  /// '123'.isHex; // true
  /// '10A'.isHex; // false
  /// ````
  bool get isHex => !regExpIsBadHex.hasMatch('$this');

  /// Converts string from `Latin-1` to normal `basic latin letters`
  /// ````dart
  /// 'hey kàwàl'.deburr; // hey kawal
  /// ````
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
  /// ````dart
  /// 'hey kàwàl'.unicodeWords; // [kàwàl]
  /// ````
  List<String> get unicodeWords {
    return _unicodeAsciiWords();
  }

  /// Returns list of `ascii words` from the string
  /// ````dart
  /// 'hey kàwàl'.asciiWords; // [hey]
  /// ````
  List<String> get asciiWords {
    return _unicodeAsciiWords(false);
  }

  /// returns `list of unicodeWords` when `isUnicode: true` other-wise returns `list of asciiWords`
  List<String> _unicodeAsciiWords([bool isUnicode = true]) {
    var list = <String>[];
    (isUnicode ? reUnicodeWord : reAsciiWord)
        .allMatches('$this')
        .forEach((match) {
      if (match[0].hasUnicodeWord == isUnicode) {
        list.add(match[0]);
      }
    });
    return list;
  }

  /// Returns `true` if string contains any occurence of `unicode word` other-wise `false`
  /// ````dart
  /// 'hey kàwàl'.hasUnicodeWord; // true
  /// 'hey'.hasUnicodeWord;      // false
  /// ````
  bool get hasUnicodeWord {
    return reHasUnicodeWord.hasMatch(this);
  }

  /// Returns `true` if string contains `unicode` other-wise `false`
  bool get hasUnicode {
    return reHasUnicode.hasMatch(this);
  }

  /// Converts the first character of string to `upper case` and the remaining to `lower case`.
  /// ````dart
  /// 'justkawal'.capitalize; // Justkawal
  /// 'JUSTKAWAL'.capitalize; // Justkawal
  /// ````
  String get capitalize {
    var result;
    if (this.isNotEmpty) {
      result = this[0].toUpperCase();
    }
    if (this.length > 1) {
      result += this.substring(1).toLowerCase();
    }
    return result;
  }

  /// Converts the first character of string to lower case.
  /// ````dart
  /// 'Justkawal'.lowerFirst; // justkawal
  /// 'JUSTKAWAL'.lowerFirst; // jUSTKAWAL
  /// ````
  String get lowerFirst {
    var result;
    if (this.isNotEmpty) {
      result = this[0].toLowerCase();
    }
    if (this.length > 1) {
      result += this.substring(1);
    }
    return result;
  }

  /// Converts the first character of string to `upper case`.
  /// ````dart
  /// 'justkawal'.upperFirst; // Justkawal
  /// 'JUSTKAWAL'.upperFirst; // JUSTKAWAL
  /// ````
  String get upperFirst {
    var result;
    if (this.isNotEmpty) {
      result = this[0].toUpperCase();
    }
    if (this.length > 1) {
      result += this.substring(1);
    }
    return result;
  }

  /// returns `list of words`
  /// ````dart
  /// 'kàwàl vu'.hasUnicodeWord; // true
  /// 'vu'.hasUnicodeWord;      // false
  /// ````
  List<String> words([RegExp pattern]) {
    if (pattern == null) {
      return reAsciiWord.hasMatch(this) ? this.asciiWords : this.unicodeWords;
    }
    return pattern.allMatches('$this').map((match) => '${match[0]}').toList();
  }

  /// --------------------- Cases Start ---------------------

  /// Converts the string to `camelCase`.
  /// ````dart
  /// '___just__kawal__'.camelCase; // justKawal
  /// '  just  Kawal  '.camelCase; // justKawal
  /// '-----just--Kawal--'.camelCase; // justKawal
  /// ````
  String get camelCase {
    var wordList = this.words();
    var leftSide = wordList.first.toLowerCase();
    var rightSide =
        wordList.skip(1).reduce((value, element) => value + element.capitalize);
    return leftSide + rightSide;
  }

  /// Converts the string to `camelCase`.
  /// ````dart
  /// '___hello__world__'.kebabCase; // hello-world
  /// '  hello  World  '.kebabCase; // hello-world
  /// '-----hello--world--'.kebabCase; // hello-world
  /// ````
  String get kebabCase {
    return this.words().map((word) => word.toLowerCase()).toList().join('-');
  }

  /// Converts the string to `lowerCase`.
  /// ````dart
  /// '___hello__world__'.kebabCase; // hello world
  /// '  hello  World  '.kebabCase; // hello world
  /// '-----hello--world--'.kebabCase; // hello world
  /// ````
  String get lowerCase {
    return this.words().map((word) => word.toLowerCase()).toList().join(' ');
  }

  /// Converts the string to `snakeCase`.
  /// ````dart
  /// '___hello__world__'.snakeCase; // hello_world
  /// '  hello  World  '.snakeCase; // hello_world
  /// '-----hello--world--'.snakeCase; // hello_world
  /// ````
  String get snakeCase {
    return this.words().map((word) => word.toLowerCase()).toList().join('_');
  }

  // --------------------- Cases End ---------------------

  /// returns `repeated string`, `n` number of times
  /// ````dart
  /// 'justkawal'.repeat(1); // justkawal
  /// '123'.repeat(2); // 123123
  /// '1'.repeat(5); // 11111
  /// ````
  String repeat([int n = 1]) {
    if ('$this' == 'null' || n < 1) {
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

  String _createPadding(int length, String chars) {
    if ((chars ?? '') == '') {
      chars = ' ';
    }

    var charsLength = chars.length;
    if (charsLength < 2) {
      return charsLength > 0 ? chars.repeat(length) : chars;
    }
    var result = chars.repeat((length / stringSize(chars)).ceil());
    return chars.hasUnicode
        ? castSlice(result.stringToList, 0, length).join('')
        : result.slice(0, length);
  }

  List<String> get stringToList {
    return this.hasUnicode ? this._unicodeToList : this._asciiToList;
  }

  List<String> get _asciiToList {
    return this.split('');
  }

  List<String> get _unicodeToList {
    return reUnicode
        .allMatches(this)
        .map((match) => match[0].toString())
        .toList();
  }
}
