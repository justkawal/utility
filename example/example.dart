// ignore: avoid_relative_lib_imports
import 'package:utility/utility.dart';

void main() {
  var latin = 'hey kàwàl';
  print(latin.deburr);
  print(latin.unicodeWords);
  print(latin.asciiWords);
  print(latin.hasUnicodeWord);
  print(latin.words());
}
