part of utility;

/// Creates a slice of `list` from `start` up to, but not including, `end`.
///
///````dart
/// var list = [1, 2, 3, 4];
///
/// // Does not alters list object and returns a new sliced list object
/// var newSlicedList = slice(list, 2); // newSlicedList = [3, 4]
///
/// // Direclty slices the list and does not makes a new object.
/// var old_object_slicedList = list.slice(2); // [3, 4]
///````
List<T> slice<T>(List<T> list, int start, [int end]) {
  if (list == null) {
    return null;
  }
  var temporaryList = List<T>.from(list);
  temporaryList.slice(start, end);
  return temporaryList;
}
