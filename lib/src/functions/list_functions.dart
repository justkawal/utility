part of utility;

///Creates an new list of elements split into groups the length of `size`.
///If `list` can't be split evenly, the final chunk will be the remaining elements.
///
///```dart
///// It returns new Object of Chunked data;
///var chunkedData = chunk(['a', 'b', 'c', 'd'], 2);
///// chunkedData = [['a', 'b'], ['c', 'd']];
///
///// It returns new Object of Chunked data;
///var list = ['a', 'b', 'c', 'd'];
///var chunkedData2 = list.chunk(3);
///// chunkedData2 = [['a', 'b', 'c'], ['d']];
///```
///
List<List<T>> chunk<T>(List<T> list, [int size = 1]) {
  return list?.chunk(size);
}

///removes `n` number of elements from the `beginning of list`
///```dart
///// If used as function,
///// it creates a new copy of the output and list's object is untouched
///var list = <int>[1, 2, 3, 4, 5];
///var newObject = drop(list); // newObject = [2, 3, 4, 5;
///
///var newObject = drop(list, 3); // newObject = [4, 5];
///
///var newObject = drop(list, 5); // newObject = []; // does not throw error :D
///
///// If used as method, it directly alter the list's object
///
///var list = <int>[1, 2, 3, 4, 5];
///list.drop(); // list = [2, 3, 4, 5];
///
///list.drop(3); // list = [5];
///
///list.drop(5); // list = []; // does not throw error :D
///```
List<T> drop<T>(List<T> list, [int n = 1]) {
  if (n < 1) {
    return List<T>.from(list);
  }
  var length = list?.length ?? 0;
  var newObject = <T>[];
  for (var i = n; i < length; i++) {
    newObject.add(list[i]);
  }
  return newObject;
}

///Creates an list of elements where the values of the list are not `Falsey`.
///
///Avoid calling it on fixed-length list.
///```dart
///// It alters the list object if the list is not fixed-length list.
///var list = ['a', null, '', false, 'b'];
///list.compact(); // ['a', 'b'];
///
///// It returns new Object of compacted data;
///var list = ['a', null, '', false, 'b'];
///
///// here the list object is not altered
///var compactedData_new_object = compact(list); // ['a', 'b'];
///```
List<T> compact<T>(List<T> list) {
  var result = <T>[];
  list?.forEach((value) {
    if (!isFalsey(value)) {
      result.add(value);
    }
  });
  return result;
}

///removes `n` number of elements from the ending of list
///```dart
/////If used as method, it directly alter the list's object
///var list = <int>[1, 2, 3, 4, 5];
///list.dropRight(); // list = [1, 2, 3, 4];
///
///list.dropRight(3); // list = [1];
///
///list.dropRight(5); // list = []; // does not throw error :D
///
/////If used as function,
/////it creates a new copy of the output and list's object is untouched
///
///var list = <int>[1, 2, 3, 4, 5];
///var newObject = dropRight(list); // newObject = [1, 2, 3, 4];
///
///var newObject = dropRight(list, 3); // newObject = [1, 2];
///
///var newObject = dropRight(list, 5); // newObject = []; // does not throw error :D
///```
List<T> dropRight<T>(List<T> list, [int n = 1]) {
  if (n > 0 && (list?.isNotEmpty ?? false)) {
    var result = <T>[];
    for (var i = 0; i < list.length - n; i++) {
      result.add(list[i]);
    }
    return result;
  }
  return <T>[];
}

///Creates a slice of `list` from `start` up to, but not including, `end`.
///```dart
///var list = [1, 2, 3, 4];
///
///// Does not alters list object and returns a new sliced list object
///var newSlicedList = slice(list, 2); // newSlicedList = [3, 4]
///
///// Direclty slices the list and does not makes a new object.
///var old_object_slicedList = list.slice(2); // [3, 4]
///```
List<T> slice<T>(List<T> list, int start, [int end]) {
  return list._privateSlice(start, end, false);
}

///starts `removing elements` from the `ending of list` until condition becomes `false`
///```dart
///var list = <int>[2, 1, 3, 4, 5];
///list.dropRightWhile((element) => element >= 3); // list = [2, 1];
///```
List<T> dropRightWhile<T>(List<T> list, bool Function(T element) test) {
  var result = <T>[];
  if (list?.isNotEmpty ?? false) {
    var index = 0;
    while (index < list.length) {
      if (!test(list[index])) {
        break;
      }
      result.add(list[index]);
      index++;
    }
  }
  return result;
}

///starts `removing elements` from the `starting of list` until condition becomes `false`
///```dart
///var list = <int>[2, 1, 3, 4, 5];
///list.dropWhile((element) => element <= 3); // list = [4, 5];
///```
List<T> dropWhile<T>(List<T> list, bool Function(T element) test) {
  var result = <T>[];
  if (list?.isNotEmpty ?? false) {
    var index = list.length - 1;
    while (index >= 0) {
      if (test(list[index])) {
        break;
      }
      result.add(list[index]);
      index--;
    }
  }
  return result;
}

///`Flattens` array a single level deep.
///
///It returns `newObject` of flattened array and does not affects the list object called-upon
///```dart
///var list = [2, [1, 3], [4, [1, [2]] ] ];
///var newList = flatten(list); // newList = [2, 1, 3, 4, [1, [2] ] ];
///```
List<T> flatten<T>(List<T> list) {
  return list.flatten();
}

///`Recursively flatten array up to depth times.`
///
///It returns `newObject` of flattened array and does not affects the list object called-upon
///```dart
///var list = [2, [1, 3], [4, [1, [2]] ] ];
///var newList = flattenDepth(list, 1); // newList = [2, 1, 3, 4, [1, [2] ] ];
///```
List<T> flattenDepth<T>(List<T> list, [int depth = 1]) {
  return list.flattenDepth(depth);
}

///`Recursively flattens array.`
///
///It returns `newObject` of deeply flattened array and does not affects the list object called-upon.
///
///```dart
///var list = [2, [1, 3], [4, [1, [2]] ] ];
///var newList = flattenDeep(list); // newList = [2, 1, 3, 4, 1, 2];
///```
List<T> flattenDeep<T>(List<T> list) {
  return list.flattenDeep();
}
