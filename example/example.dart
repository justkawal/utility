// ignore: avoid_relative_lib_imports
import 'package:utility/utility.dart';
import 'package:test/test.dart';

void main() {
  // -------------- list operations start --------------
  var numberList = <num>[20.0, 5, 1.0, 10, null, 25];
  var stringList = <String>['Kawal', 'Ashumendra', null, 'Github'];
  var dynamicList = <dynamic>[
    'Ashumendra',
    5,
    false,
    null,
    'justkawal',
    Object()
  ];

  var temporaryNumberList = numberList;
  var temporaryStringList = stringList;
  var temporaryDynamicList = dynamicList;

  var slicedList = slice(temporaryNumberList, 2);

  temporaryNumberList.slice(2); 
  print(temporaryNumberList);// output = [1.0, 10, null, 25];
  temporaryNumberList.slice(2); // output = [null, 25];
  print(temporaryNumberList);
  temporaryNumberList.slice(2); // output = [];
  print(temporaryNumberList);

  temporaryNumberList = numberList;
  print(temporaryNumberList);

  // numberList.slice(2); // method operates on object and alters the object.and

  // var slicedList = slice(numberList, 2); // functions operates on copy of object

  print(slicedList);

  // -------------- list operations end --------------
}
