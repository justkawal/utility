import 'package:test/test.dart';
import 'package:utility/utility.dart';

void main() {
  /// ===================== List Operations Start =====================
  group('List Operations: ', () {
    ///
    /// --------------- Slice Start ---------------
    ///

    test('Slice', () {
      var numberList = <num>[20.0, 5, 1.0, 10, null, 25];
      var dynamicList = <dynamic>['Ashumendra', 5, false, null, 'justkawal'];
      var slicedList = slice(dynamicList, 2);

      expect(slicedList, equals([false, null, 'justkawal']));
      expect(numberList.slice(2), equals([1.0, 10, null, 25]));
      expect(numberList.slice(-2), equals([null, 25]));
      expect(numberList.slice(null), equals([null, 25]));
      expect(numberList.slice(2), equals([]));
      expect(dynamicList.slice(-4, -1), equals([5, false, null]));
    });

    ///
    /// --------------- Slice End ---------------
    ///

    ///
    /// --------------- isGrowable Start ---------------
    ///

    var list = List<dynamic>(8);
    var list1 = <dynamic>[];
    test('isGrowable', () {
      expect(list.isGrowable, equals(false));
      expect(list1.isGrowable, equals(true));
    });

    ///
    /// --------------- isGrowable End ---------------
    ///

    ///
    /// --------------- random Start ---------------
    ///
    var randomlist = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    test('random', () {
      var number = randomlist.random(remove: false);
      expect(randomlist, contains(number));
    });

    ///
    /// --------------- random End ---------------
    ///

    ///
    /// --------------- Drop Start ---------------
    ///
    test('Drop', () {
      expect(randomlist.drop(), equals([2, 3, 4, 5, 6, 7, 8, 9, 10]));
      expect(randomlist.drop(2), equals([4, 5, 6, 7, 8, 9, 10]));
      expect(randomlist.dropRight(), equals([4, 5, 6, 7, 8, 9]));
      expect(randomlist.dropRight(2), equals([4, 5, 6, 7]));
      expect(
          randomlist.dropRightWhile((element) => element >= 6), equals([4, 5]));
      expect(randomlist.dropWhile((element) => element >= 4), equals([5]));
      expect(randomlist.dropWhile((element) => element >= 6), equals([5]));
    });

    ///
    /// --------------- Drop End ---------------
    ///

    ///
    /// --------------- Flatten Start ---------------
    ///
    test('Flatten', () {
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

      var flattenlist = [
        2,
        [2.4, 5],
        [
          2,
          [6, 9, 5]
        ],
        5
      ];
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

    ///
    /// --------------- Flatten End ---------------
    ///

    var compactlist = ['a', 'v', 'l', null, true, 'r', 'o', false];
    var chunkList = List<Object>.from(compactlist);

    ///
    /// --------------- Compact Start ---------------
    ///
    test('Compact', () {
      expect(compactlist.compact(), equals(['a', 'v', 'l', true, 'r', 'o']));
      var newcompact = compact(compactlist);
      expect(newcompact, equals(['a', 'v', 'l', true, 'r', 'o']));
    });

    ///
    /// --------------- Compact End ---------------
    ///

    ///
    /// --------------- Chunk Start ---------------
    ///

    test('Chunk', () {
      expect(
          chunkList.chunk(2),
          equals([
            ['a', 'v'],
            ['l', null],
            [true, 'r'],
            ['o', false]
          ]));
    });

    ///
    /// --------------- Chunk End ---------------
    ///

    ///
    /// --------------- Heap Sort Start ---------------
    ///
    var heapList = <num>[20.0, 5, 1.0, 10, 25];
    var heaplist1 = [6, 9, 2, 1, 77, 8, 234, 9987, 12390, 98, 45];

    test('HeapSort', () {
      var newnumb = heapList.heapSort();
      expect(newnumb, equals([1.0, 5, 10, 20.0, 25]));
      expect(heaplist1.heapSort(),
          equals([1, 2, 6, 8, 9, 45, 77, 98, 234, 9987, 12390]));
    });

    ///
    /// --------------- Heap Sort End ---------------
    ///
  });

  /// ===================== List Operations End =====================

  /// ===================== Number Operations Start =====================

  group('Number Operations:', () {
    ///
    /// --------------- >>> Start ---------------
    ///
    test('>>>', () {
      var number = 20.zeroFillRightShift(3);
      expect(number, equals(2));
      var number1 = zeroFillRightShift(40, 3);
      expect(number1, equals(5));
    });

    ///
    /// --------------- >>> End ---------------
    ///

    ///
    /// --------------- xor Start ---------------
    ///
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

    ///
    /// --------------- xor End ---------------
    ///

    ///
    /// --------------- Divide Start ---------------
    ///
    test('Divide', () {
      var dividend = 90;
      var divisor = 15;
      expect(20.divide(10), equals(2));
      expect(200.divide(-40), equals(-5));
      expect(dividend.divide(divisor), equals(6));
    });

    ///
    /// --------------- Divide End ---------------
    ///
  });

  /// ===================== Number Operations End =====================

  /// ===================== String Operations Start =====================

  group('String Operations:', () {
    test('slice', () {
      var value = 'hello Everyone Happy New year 2021';
      expect(value.slice(2), equals('llo Everyone Happy New year 2021'));
      expect(value.slice(-18), equals('appy New year 2021'));
      expect(value.slice(1, 9), equals('ello Eve'));
      expect(value.slice(0), equals('hello Everyone Happy New year 2021'));
    });

    test('toNumber', () {
      expect('20912'.toNumber, equals(20912));
      expect(' 109.09876'.toNumber, equals(109.09876));
      expect('-9346'.toNumber, equals(-9346));
      expect('  '.toNumber, equals(null));
    });

    test('Count', () {
      expect('justkawal'.count('a'), equals(2));
      expect('github@justkawal'.count('t'), equals(2));
      expect('occurance'.count('c'), equals(3));
    });

    test('isNumber', () {
      expect('justkawal'.isNumber, isFalse);
      expect('123'.isNumber, isTrue);
      expect('-123'.isNumber, isTrue);
      expect('123.0.0'.isNumber, isFalse);
      expect('-123.0'.isNumber, isTrue);
      expect('occ1234urance'.isNumber, isFalse);
    });
  });

  /// ===================== String Operations Start =====================
}
