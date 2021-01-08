part of utility;

///removes `n` number of elements from the `beginning of list`
///```dart
///// If used as function,
///// it creates a new copy of the output and list's object is untouched
///var list = <int>[1, 2, 3, 4, 5];
///var newObject = list.dropRight(); // newObject = [1, 2, 3, 4];
///
///var list = <int>[1, 2, 3, 4, 5];
///var newObject = list.dropRight(3); // newObject = [1, 2];
///
///var list = <int>[1, 2, 3];
///var newObject = list.dropRight(5); // newObject = []; // does not throw error :D
///
///// If used as method, it directly alter the list's object
///var list = <int>[1, 2, 3, 4, 5];
///list.drop(); // list = [2, 3, 4, 5];
///
///var list = <int>[1, 2, 3, 4, 5];
///list.drop(3); // list = [4, 5];
///
///var list = <int>[1, 2, 3];
///list.drop(5); // list = []; // does not throw error :D
///```
List<T> drop<T>(List<T> list, [int n = 1]) {
  // TODO: @Kawal - check functionality working on main website of mdn
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
