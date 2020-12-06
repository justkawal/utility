part of utility;

num toNumber(dynamic value, {bool silenced = false}) {
  if (value is num) {
    return value;
  }
  if (value is! String) {
    if (silenced) {
      return null;
    }
    throw Exception('Only String and num allowed.');
  }
  return int.tryParse(value.toString().trim());
}

//value = value.replace(reTrim, '')
/* var isBinary = reIsBinary.hasMatch(value);
  return (isBinary || reIsOctal.hasMatch(value))
    ? num.parse(value.slice(2), isBinary > 0 ? 2 : 8)
    : (reIsBadHex.test(value) ? NAN : +value) */
