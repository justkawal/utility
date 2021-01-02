part of utility;

/// Creates an list of elements where the values of the list are not `Falsey`.
/// Avoid calling it on fixed-length list.
///
/// ````dart
/// // It alters the list object if the list is not fixed-length list.
/// var list = ['a', null, '', false, 'b'];
/// var compactedData = list.compact(); // ['a', 'b'];
///
/// // It returns new Object of compacted data;
/// var list = ['a', null, '', false, 'b'];
/// // here the list object is not altered
/// var compactedData_new_object = compact(list); // ['a', 'b'];
///````
List<T> compact<T>(List<T> list) {
  if (list == null) {
    return null;
  }
  var temporaryList = List<T>.from(list);
  return temporaryList.compact();
}
