// ignore: avoid_relative_lib_imports
import 'package:utility/utility.dart';

void main() {
  print('abc'.pad(8)); // '  abc   '
  print('abc'.pad(8, '=_')); // '=_abc=_='
  print(' hey kàwàl'.asciiWords); // 'abc'

}
