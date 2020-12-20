part of utility;

/// returns `true` if value is (`null`  or  `false`  or  `''`  or  `0`);
///
/// otherwise returns `false`
bool isFalsey(dynamic value) {
  return value == null || value == false || '$value'.trim() == '' || value == 0;
}
