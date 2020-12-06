part of utility;

///
///Creates a slice of `list` from `start` up to, but not including, `end`.
///
///````dart
///var list = [1, 2, 3, 4];
///
///// Does not affects on the data of list and returns a new sliced list object
///var newSlicedList = slice(list, 2); // newSlicedList = [3, 4]
///
///// Does not affects on the data of list and returns a new sliced list object
///var newSlicedList = list.slice(2); // list = [3, 4]
///
///````
List<T> slice<T>(List<T> list, int start, [int end]) {
  var temporaryList = List<T>.from(list);
  temporaryList.slice(start, end);
  return List<T>.from(temporaryList);
}
