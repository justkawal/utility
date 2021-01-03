// ignore: avoid_relative_lib_imports
import 'package:utility/utility.dart';

void main() {
  // -------------- list operations start --------------

  var numberList = <num>[20.0, 5, 1.0, 10, 25];

  print('before slicing: $numberList');
  numberList.slice(2);
  print('after slicing on 2: $numberList');

  var newSortedObject = numberList.heapSort(inPlace: false);
  print('sorted Object: $newSortedObject');

  var stringList = <String>['Subscribe', 'to', 'MrBeast', 'and', 'Click', 'bell', 'icon'];
  var newSlicedObject = slice(stringList, 0, 3);
  print('new sliced Object slicing\n$newSlicedObject');

  var dynamicList = <dynamic>['Subscribe', 'to', 'MrBeast', 5, false, null, 'India', 'MrBeast'];



  // -------------- list operations end --------------
}
