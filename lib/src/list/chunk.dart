part of utility;

///
///Creates an list of elements split into groups the length of `size`.
///If `list` can't be split evenly, the final chunk will be the remaining
///elements.
///
///
///````dart
///// It returns new Object of Chunked data;
///var chunkedData = chunk(['a', 'b', 'c', 'd'], 2);
///// chunkedData = [['a', 'b'], ['c', 'd']];
///
///// It returns new Object of Chunked data;
///var list = ['a', 'b', 'c', 'd'];
///chunkedData = list.chunk(3);
///// chunkedData = [['a', 'b', 'c'], ['d']];
///````
///
List<List<T>> chunk<T>(List<T> list, [int size = 1]) {
  var temporaryList = List<T>.from(list);
  return temporaryList.chunk(size);
}
