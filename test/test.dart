import 'dart:math';

import 'package:test/test.dart';
import 'package:utility/utility.dart';

void main() {
  group('list', () {
    var numberList = <num>[20.0, 5, 1.0, 10, null, 25];
    var heapList = <num>[20.0, 5, 1.0, 10, 25];
    var heaplist1 = [6, 9, 2, 1, 77, 8, 234, 9987, 12390, 98, 45];

    var dynamicList = <dynamic>[
      'Ashumendra',
      5,
      false,
      null,
      'justkawal',
      Object()
    ];
    var slicedList = slice(dynamicList, 2);
    var flattenlist = [
      2,
      [2.4, 5],
      [
        2,
        [6, 9, 5]
      ],
      5
    ];
    var tempflattenlist = flattenlist;
    var randomlist = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    var compactlist = ['a', 'v', 'l', null, true, 'r', 'o', false];
    var tempchunklist = compactlist;

    var list = List<dynamic>(8);
    var list1 = List<dynamic>();

    test('Slice', () {
      // expect(slicedList, equals([false, null, 'justkawal', 'Instance of Object']));

      expect(numberList.slice(2), equals([1.0, 10, null, 25]));
      expect(numberList.slice(-2), equals([null, 25]));
      expect(numberList.slice(null), equals([null, 25]));
      expect(numberList.slice(2), equals([]));
      // expect(dynamicList.slice(-4, -1), equals([false, null, 'justkawal',Object()]));
    });

    test('Growable', () {
      expect(list.isGrowable, equals(false));
      expect(list1.isGrowable, equals(true));
    });

    test('random', () {
      var number = randomlist.random(remove: false);
      expect(randomlist, contains(number));
    });

    test('drop', () {
      expect(randomlist.drop(), equals([2, 3, 4, 5, 6, 7, 8, 9, 10]));
      expect(randomlist.drop(2), equals([4, 5, 6, 7, 8, 9, 10]));
      expect(randomlist.dropRight(), equals([4, 5, 6, 7, 8, 9]));
      expect(randomlist.dropRight(2), equals([4, 5, 6, 7]));
      expect(
          randomlist.dropRightWhile((element) => element >= 6), equals([4, 5]));
      expect(randomlist.dropWhile((element) => element >= 4), equals([5]));
      expect(randomlist.dropWhile((element) => element >= 6), equals([5]));
    });

    var flattendeeplist = [
      2,
      [1, 3],
      [
        4,
        [
          1,
          [2]
        ]
      ]
    ];

    test('Flatten', () {
      expect(
          flattenlist.flatten(),
          equals([
            2,
            2.4,
            5,
            2,
            [6, 9, 5],
            5
          ]));
      expect(
          flattenlist.flattenDepth(1),
          equals([
            2,
            2.4,
            5,
            2,
            [6, 9, 5],
            5
          ]));
      expect(flattenlist.flattenDepth(2), equals([2, 2.4, 5, 2, 6, 9, 5, 5]));
      expect(flattendeeplist.flattenDeep(), equals([2, 1, 3, 4, 1, 2]));
    });

    test('Compact', () {
      expect(compactlist.compact(), equals(['a', 'v', 'l', true, 'r', 'o']));
      var newcompact = compact(compactlist);
      expect(newcompact, equals(['a', 'v', 'l', true, 'r', 'o']));
    });

    // test('Chunk', () {
    //   expect(chunklist.chunk(), equals([]));
    // });

    test('HeapSort', () {
      var newnumb = heapList.heapSort();

      expect(newnumb, equals([1.0, 5, 10, 20.0, 25]));
      expect(heaplist1.heapSort(),
          equals([1, 2, 6, 8, 9, 45, 77, 98, 234, 9987, 12390]));
    });
  });

  // <=====================Number Operations===============>

  group('Number Operations', () {
    test('mimic', () {
      var number = 20.zeroFillRightShift(3);
      expect(number, equals(2));
      var number1 = zeroFillRightShift(40, 3);
      expect(number1, equals(5));
    });

    test('Xor', () {
      var number = 20.xor(3);
      expect(number, equals(23));
      var number1 = 10.xor(-2);
      expect(number1, equals(-12));
      var number2 = 10.xor(-20);
      expect(number2, equals(-26));
      var number3 = 10.xor(0);
      expect(number3, equals(10));
    });

    test('Divide', () {
      var dividend = 90;
      var divisor = 15;
      expect(20.divide(10), equals(2));

      expect(200.divide(-40), equals(-5));
      expect(dividend.divide(divisor), equals(6));
    });
  });

  // <=====================String Operations ===============>

  group('String Operations', () {
    test('slice', () {
      var value = 'hello Everyone New year 2021';
      expect(value.slice(2), equals('llo Everyone New year 2021'));
      expect(value.slice(-18), equals('yone New year 2021'));
      expect(value.slice(1, 9), equals('ello Eve'));

      expect(value.slice(0), equals('hello Everyone New year 2021'));
    });

    test('toNumber', () {
      expect('20912'.toNumber, equals(20912));
      expect(' 109.09876'.toNumber, equals(109.09876));
      expect('-9346'.toNumber, equals(-9346));
      expect('  '.toNumber, equals(null));
    });

    test('Count', () {
      expect('Counttokarega'.count('a'), equals(2));

      expect('justllkawal'.count('l'), equals(3));
      expect('occurance'.count('c'), equals(3));
    });

    test('isNumber', () {
      expect('Counttokarega'.isNumber, isFalse);
      // var value = isNumber('1234');
      // expect(value, isTrue);
      expect('occ1234urance'.isNumber, isFalse);
    });
  });
}
