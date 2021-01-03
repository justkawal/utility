// ignore: avoid_relative_lib_imports
import 'package:utility/utility.dart';

void main() {
  // -------------- list operations start --------------
  var numberList = <num>[20.0, 5, 1.0, 10, null, 25];
  var stringList = <String>['Kawal', 'Ashumendra', null, 'Github'];
  var dynamicList = <dynamic>['Ashumendra', 5, false, null, 'justkawal'];

  for (var i = -7; i < 8; i++) {
    dynamicList.slice(i, 8);
    print('$i: ' + dynamicList.toString());
  }

  // numberList.slice(2); // method operates on object and alters the object.and

  // var slicedList = slice(numberList, 2); // functions operates on copy of object

  // -------------- list operations end --------------
}
