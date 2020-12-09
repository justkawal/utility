// ignore: avoid_relative_lib_imports
import '../lib/utility.dart';

void main() {
  var list = [
    2,
    [1, 3],
    [
      4,
      [
        '1',
        [2]
      ]
    ]
  ];
  //compact([0, 1, null, true, false, 'hey', '', 'hi']);
  //print(list.flattenDepth(1).toString());
  //print(isNumber(2.12));
  //print('awesome: ${list}');
  print('déjà vu'.deburr);
  print('déjà vu'.unicodeWords);
  print('déjà vu'.asciiWords);
  print('___Foo_Bar--__'.camelCase);
  print('___Foo_Bar--__'.kebabCase);
  print('abc'.repeat(2));
  print('justkawal'.slice(0));
}
