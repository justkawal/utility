part of utility;

///
/// returns `true` is value is (`null`  or  `false`  or  `''`  or  `0`);
///
/// otherwise returns `false`
bool isFalsey(dynamic value) =>
    value == null ||
    value == false ||
    value.toString().trim() == '' ||
    value == 0;
