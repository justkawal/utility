part of utility;

/// returns `true` if value is (`null`  or  `false`  or  `''`  or  `0`);
///
/// otherwise returns `false`
bool isFalsey(dynamic value) {
  return value == null ||
      (value is bool && value == false) ||
      (value is String && value.trim() == '') ||
      (value is num && value == 0);
}
