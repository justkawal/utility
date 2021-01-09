// ignore: avoid_relative_lib_imports
import 'package:utility/utility.dart';

void main() {
  print('abc'.pad(8)); // '  abc   '
  print('abc'.pad(8, '=_')); // '=_abc=_='
  print('abc'.pad(3)); // 'abc'
}
