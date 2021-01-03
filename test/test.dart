import 'package:test/test.dart';
import 'package:utility/utility.dart';
void main(){

  group('list', () {
    test('Slice', () {
      var list = [1, 2, 3, 4];
      expect(list.slice(2), equals([3, 4]));
    });
    test('random', () {
      var list = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      expect(list.random(), equals(4));
    });

      test('.remainder() returns the remainder of division', () {
      expect(11.remainder(3), equals(2));
    });
  });
}