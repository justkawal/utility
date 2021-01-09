import 'package:test/test.dart';
import 'package:utility/utility.dart';

/// enum for testing: string operation
enum justkawal {
  just,
  kawal,
}
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
    /// --------------- drop Start ---------------
    ///
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

    ///
    /// --------------- drop End ---------------
    ///

    ///
    /// --------------- flatten Start ---------------
    ///
    test('flatten', () {
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
    /// --------------- flatten End ---------------
    ///

    var compactlist = ['a', 'v', 'l', null, true, 'r', 'o', false];
    var chunkList = List<Object>.from(compactlist);

    ///
    /// --------------- compact Start ---------------
    ///
    test('compact', () {
      expect(compactlist.compact(), equals(['a', 'v', 'l', true, 'r', 'o']));
      var newcompact = compact(compactlist);
      expect(newcompact, equals(['a', 'v', 'l', true, 'r', 'o']));
    });

    ///
    /// --------------- compact End ---------------
    ///

    ///
    /// --------------- chunk Start ---------------
    ///

    test('chunk', () {
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
    /// --------------- chunk End ---------------
    ///

    ///
    /// --------------- Heap Sort Start ---------------
    ///
    var heapList = <num>[20.0, 5, 1.0, 10, 25];
    var heaplist1 = [6, 9, 2, 1, 77, 8, 234, 9987, 12390, 98, 45];

    /// --------------- Heapsort Start ---------------
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
    /// --------------- >>> (zero Fill Right Shift) Start ---------------
    ///
    test('>>> (zero Fill Right Shift)', () {
      var number = 20.zeroFillRightShift(3);
      expect(number, equals(2));
      var number1 = zeroFillRightShift(40, 3);
      expect(number1, equals(5));
    });

    ///
    /// --------------- >>> ( zero Fill Right Shift ) End ---------------
    ///

    ///
    /// --------------- xor Start ---------------
    ///
    test('xor', () {
      expect(20.xor(3), equals(23));
      expect(10.xor(-2), equals(-12));
      expect(10.xor(-20), equals(-26));
      expect(10.xor(0), equals(10));
    });

    ///
    /// --------------- xor End ---------------
    ///

    ///
    /// --------------- divide Start ---------------
    ///
    test('divide', () {
      var dividend = 90;
      var divisor = 15;
      expect(20.divide(10), equals(2));
      expect(200.divide(-40), equals(-5));
      expect(dividend.divide(divisor), equals(6));
    });

    ///
    /// --------------- divide End ---------------
    ///
  });

  /// ===================== Number Operations End =====================

  /// ===================== String Operations Start =====================

  group('String Operations:', () {
    ///
    /// --------------- slice Start ---------------
    ///
    test('slice', () {
      var value = 'hello Everyone Happy New year 2021';
      expect(value.slice(2), equals('llo Everyone Happy New year 2021'));
      expect(value.slice(-18), equals('appy New year 2021'));
      expect(value.slice(1, 9), equals('ello Eve'));
      expect(value.slice(0), equals('hello Everyone Happy New year 2021'));
    });

    ///
    /// --------------- slice End ---------------
    ///

    ///
    /// --------------- toNumber Start ---------------
    ///
    test('toNumber', () {
      expect('20912'.toNumber, equals(20912));
      expect(' 109.09876'.toNumber, equals(109.09876));
      expect('-9346'.toNumber, equals(-9346));
      expect('  '.toNumber, equals(null));
    });

    ///
    /// --------------- toNumber End ---------------
    ///

    ///
    /// --------------- count Start ---------------
    ///
    test('count', () {
      expect('justkawal'.count('a'), equals(2));
      expect('github@justkawal'.count('t'), equals(2));
      expect('occurance'.count('c'), equals(3));
    });

    /// --------------- Count End ---------------
    ///
    /// --------------- count End ---------------
    ///

    ///
    /// --------------- isNumber Start ---------------
    ///
    test('isNumber', () {
      expect('justkawal'.isNumber, isFalse);
      expect('123'.isNumber, isTrue);
      expect('-123'.isNumber, isTrue);
      expect('123.0.0'.isNumber, isFalse);
      expect('-123.0'.isNumber, isTrue);
      expect('occ1234urance'.isNumber, isFalse);
    });

    ///
    /// --------------- isNumber End ---------------
    ///

    ///
    /// --------------- enumVal Start ---------------
    ///
    test('enumVal', () {
      ///
      /// enum justkawal {
      ///   just,
      ///   kawal,
      /// }
      /// justkawal enum is declared on line number 4
      expect('${justkawal.just}'.enumVal, equals('just'));
      expect('${justkawal.kawal}'.enumVal, equals('kawal'));
    });

    ///
    /// --------------- enumVal End ---------------
    ///

    /// --------------- isBinary Start ---------------

    test('isBinary', () {
      expect('Counttokarega'.isBinary, isFalse);
      expect('1234'.isBinary, isFalse);
      expect('occ1234urance'.isBinary, isFalse);
      // var value = '0101010';
      // expect(value.isBinary, isTrue);
    });

    /// --------------- isBinary End ---------------

    /// --------------- isDecimal Start ---------------

    test('isDecimal', () {
      expect('Counttokarega'.isDecimal, isFalse);
      expect('1234'.isDecimal, isTrue);
      expect('occ1234urance'.isDecimal, isFalse);
    });

    ///
    /// --------------- isDecimal End ---------------
    ///

    ///
    /// --------------- isOctal Start ---------------
    ///

    test('isOctal', () {
      expect('Counttokarega'.isOctal, isFalse);
      expect('1234'.isOctal, isFalse);
      // expect('123'.isOctal, isTrue);
      expect('occ1234urance'.isOctal, isFalse);
    });

    ///
    /// --------------- isOctal End ---------------
    ///

    ///
    /// --------------- isHex Start ---------------
    ///

    test('isHex', () {
      expect('Counttokarega'.isHex, isTrue);
      expect('1234'.isHex, isTrue);
      expect('123'.isHex, isTrue);
      expect('occ1234urance'.isHex, isTrue);
      expect('null'.isHex, isTrue);
    });

    ///
    /// --------------- isHex End ---------------
    ///

    ///
    /// --------------- deburr Start ---------------
    ///

    test('deburr', () {
      expect('hey kawal'.isHex, isTrue);
      expect('1234'.isHex, isTrue);
      expect('123'.isHex, isTrue);
      expect('occ1234urance'.isHex, isTrue);
      expect('null'.isHex, isTrue);
    });

    ///
    /// --------------- deburr End ---------------
    ///

    ///
    /// --------------- capitalize Start ---------------
    ///

    test('Capitalize', () {
      expect('Counttokarega'.capitalize, equals('Counttokarega'));
      expect('RAMAN'.capitalize, equals('Raman'));
      expect('SHYaM'.capitalize, equals('Shyam'));
      expect('occ1234urance'.capitalize, equals('Occ1234urance'));
      expect('123null'.capitalize, equals('123null'));
    });

    ///
    /// --------------- capitalize End ---------------
    ///

    ///
    /// --------------- lowerfirst Start ---------------
    ///

    test('LowerFirst', () {
      expect('Counttokarega'.lowerFirst, equals('counttokarega'));
      expect('RAMAN'.lowerFirst, equals('rAMAN'));
      expect('SHYaM'.lowerFirst, equals('sHYaM'));
      expect('occ1234urance'.lowerFirst, equals('occ1234urance'));
      expect('123null'.lowerFirst, equals('123null'));
    });

    ///
    /// --------------- lowerfirst End ---------------
    ///

    ///
    /// --------------- upperfirst Start ---------------
    ///

    test('UpperFirst', () {
      expect('Counttokarega'.upperFirst, equals('Counttokarega'));
      expect('RAMAN'.upperFirst, equals('RAMAN'));
      expect('SHYaM'.upperFirst, equals('SHYaM'));
      expect('occ1234urance'.upperFirst, equals('Occ1234urance'));
      expect('123null'.upperFirst, equals('123null'));
    });

    ///
    /// --------------- upperfirst End ---------------
    ///

    ///
    /// --------------- camelCase Start ---------------
    ///

    test('camelCase', () {
      expect('---count===Number'.camelCase, equals('countNumber'));
      expect('RAMAN-----Hello'.camelCase, equals('ramanHello'));
      expect('shyam    Cool'.camelCase, equals('shyamCool'));
      expect('occ-------urance'.camelCase, equals('occurance'));
      expect('-----add=====Null'.camelCase, equals('addNull'));
    });

    ///
    /// --------------- camelCase End ---------------
    ///

    ///
    /// --------------- kebabCase Start ---------------
    ///

    test('kebabCase', () {
      expect('---count===Number'.kebabCase(), equals('count-number'));
      expect('RAMAN-----Hello'.kebabCase(), equals('raman-hello'));
      expect('shyam    Cool'.kebabCase(), equals('shyam-cool'));
      expect('occ-------urance'.kebabCase(), equals('occ-urance'));
      expect('-----add=====Null'.kebabCase(), equals('add-null'));
      expect('-----add=====1234'.kebabCase(), equals('add-1234'));
      expect('@@@@@@add#####'.kebabCase(), equals('add'));
    });

    ///
    /// --------------- kebabCase End ---------------
    ///

    ///
    /// --------------- lowerCase Start ---------------
    ///

    test('lowerCase', () {
      expect('---count===Number'.lowerCase(), equals('count number'));
      expect('RAMAN-----Hello'.lowerCase(), equals('raman hello'));
      expect('------shyam-----------Cool'.lowerCase(), equals('shyam cool'));
      expect('occ-------urance'.lowerCase(), equals('occ urance'));
      expect('-----add=====Null'.lowerCase(), equals('add null'));
      expect('-----add=====1234'.lowerCase(), equals('add 1234'));
      expect('@@@@@@add#####'.lowerCase(), equals('add'));
    });

    ///
    /// --------------- lowerCase End ---------------
    ///

    ///
    /// --------------- snakeCase Start ---------------
    ///

    test('snakeCase', () {
      expect('---count===Number'.snakeCase(), equals('count_number'));
      expect('RAMAN-----Hello'.snakeCase(), equals('raman_hello'));
      expect('------shyam-----------Cool'.snakeCase(), equals('shyam_cool'));
      expect('occ-------urance'.snakeCase(), equals('occ_urance'));
      expect('-----add=====Null'.snakeCase(), equals('add_null'));
      expect('-----add=====1234'.snakeCase(), equals('add_1234'));
      expect('@@@@@@add#####'.snakeCase(), equals('add'));
    });

    ///
    /// --------------- snakeCase End ---------------
    ///

    ///
    /// --------------- nameCase Start ---------------
    ///

    test('nameCase', () {
      expect('---count===Number'.nameCase(), equals('Count Number'));
      expect('RAMAN-----Hello'.nameCase(), equals('Raman Hello'));
      expect('------shyam-----------Cool'.nameCase(), equals('Shyam Cool'));
      expect('occ-------urance'.nameCase(), equals('Occ Urance'));
      expect('-----add=====Null'.nameCase(), equals('Add Null'));
      expect('-----add=====1234'.nameCase(), equals('Add 1234'));
      expect('@@@@@@add#####digit'.nameCase(), equals('Add Digit'));
    });

    ///
    /// --------------- nameCase End ---------------
    ///

    ///
    /// --------------- repeat Start ---------------
    ///
    test('repeat', () {
      expect('1'.repeat(2), equals('11'));
      //expect('RAMAN-----Hello'.nameCase(), equals('Raman Hello'));
      //expect('------shyam-----------Cool'.nameCase(), equals('Shyam Cool'));
      //expect('occ-------urance'.nameCase(), equals('Occ Urance'));
      //expect('-----add=====Null'.nameCase(), equals('Add Null'));
      //expect('-----add=====1234'.nameCase(), equals('Add 1234'));
      //expect('@@@@@@add#####digit'.nameCase(), equals('Add Digit'));
    });

    ///
    /// --------------- repeat End ---------------
    ///

    ///
    /// --------------- pad Start ---------------
    ///
//showing Error
    // test('pad', () {
    //   expect('--'.pad(4), equals('--'));
    //   expect('abc'.pad(8,'=_'), equals('=_abc=_='));
    //   expect('------shyam-----------Cool'.nameCase(), equals('Shyam Cool'));
    //   expect('occ-------urance'.nameCase(), equals('Occ Urance'));
    //   expect('-----add=====Null'.nameCase(), equals('Add Null'));
    //   expect('-----add=====1234'.nameCase(), equals('Add 1234'));
    //   expect('@@@@@@add#####digit'.nameCase(), equals('Add Digit'));
    // });

    ///
    /// --------------- pad End ---------------
    ///
  });
  /// ===================== String Operations End =====================
}
