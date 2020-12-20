part of utility;

/// returns `true` is `s` is number otherwise `false`
bool isNumber(dynamic s) {
  if (s is num) {
    return true;
  }
  return double.tryParse(s.toString()) ?? false;
}
