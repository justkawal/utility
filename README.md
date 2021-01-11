# Utility
  
  <a href="https://flutter.io">  
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"  
      alt="Platform" />  
  </a> 
   <a href="https://pub.dartlang.org/packages/utility">  
    <img src="https://img.shields.io/pub/v/utility.svg"  
      alt="Pub Package" />  
  </a>
   <a href="https://opensource.org/licenses/MIT">  
    <img src="https://img.shields.io/badge/License-MIT-red.svg"  
      alt="License: MIT" />  
  </a>  
   <a href="https://www.paypal.me/kawal7415">  
    <img src="https://img.shields.io/badge/Donate-PayPal-green.svg"  
      alt="Donate" />  
  </a>
   <a href="https://github.com/justkawal/utility/issues">  
    <img src="https://img.shields.io/github/issues/justkawal/utility"  
      alt="Issue" />  
  </a> 
   <a href="https://github.com/justkawal/utility/network">  
    <img src="https://img.shields.io/github/forks/justkawal/utility"  
      alt="Forks" />  
  </a> 
   <a href="https://github.com/justkawal/utility/stargazers">  
    <img src="https://img.shields.io/github/stars/justkawal/utility"  
      alt="Stars" />  
  </a>
  <br>
  <br>
 
 [Utility](https://www.pub.dev/packages/utility) provides functionality to improve dart code and make things faster and more easy.



# Table of Contents
  - [Installing](#lets-get-started)
  - [Usage](#usage)
    * [List Operations](#list-operations)
    * [String Operations](#list-operations)
    * [Number Operations](#list-operations)
  - [Upcoming Features](#features-coming-in-next-version)
  - [Donate (Be the First one)](#donate-be-the-first-one)

# Lets Get Started

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  utility: any
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```css
$  pub get
```

with `Flutter`:

```css
$  flutter packages get
```

### 3. Import it

Now in your `Dart` code, you can use: 

```dart
import 'package:utility/utility.dart';
```

# Usage

## List Operations
### slice
Creates a slice of `list` from `start` up to `end`[exclusive].
```dart
var list = [1, 2, 3, 4];

//It slices the list elements and hence modifies this list
list.slice(2); // list = [3, 4]

// Do not want to alter the list object ??
var list = [1, 2, 3, 4];

//It creates copy of list slices the list elements and creates new list
list.slice(2); // list = [3, 4]
```

### removeFirst();
Removes items at `0` position in the list.
```dart
var list = <int>[1, 5, 2, 4];
var firstItem = list.removeFirst();
// altered list = [5, 2, 4];
```

### random
returns `random value` from list. If list is empty then it returns `null`
```dart
var list = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var randomValue = list.random(); // 3 // 3 will not be removed from list

// If remove = true is passed as argument then polled random item will be removed from list

// before list is
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

var randomValue list.random(remove: true); // 5
// after calling with remove = true
// [1, 2, 3, 4, 6, 7, 8, 9, 10]

// If secure = true is passed as argument then Random.secure() is used
var randomValue list.random(secure: true); // 5
```

### isGrowable
returns `true` if it is `Growable list` otherwise false.
```dart
// On Non-Growable List
var list = List<dynamic>(8);
var isGrowable = list.isGrowable; // false

// On Growable List
var list2 = List<dynamic>();
var isGrowable = list2.isGrowable; // true
```

### drop
removes `n` number of elements from the `beginning of list`
```dart
//If used as method, it directly alter the list's object
var list = <int>[1, 2, 3, 4, 5];
list.drop(); // list = [2, 3, 4, 5];

var list = <int>[1, 2, 3, 4, 5];
list.drop(3); // list = [4, 5];

var list = <int>[1, 2, 3];
list.drop(5); // list = []; // does not throw error :D

//If used as function,
//it creates a new copy of the output and list's object is untouched
var list = <int>[1, 2, 3, 4, 5];
var newObject = list.dropRight(); // newObject = [1, 2, 3, 4];

var list = <int>[1, 2, 3, 4, 5];
var newObject = list.dropRight(3); // newObject = [1, 2];

var list = <int>[1, 2, 3];
var newObject = list.dropRight(5); // newObject = []; // does not throw error :D
```

### dropRight
removes `n` number of elements from the ending of list
```dart
//If used as method, it directly alter the list's object
var list = <int>[1, 2, 3, 4, 5];
list.dropRight(); // list = [1, 2, 3, 4];

var list = <int>[1, 2, 3, 4, 5];
list.dropRight(3); // list = [1, 2];

var list = <int>[1, 2, 3];
list.dropRight(5); // list = []; // does not throw error :D

//If used as function,
//it creates a new copy of the output and list's object is untouched
var list = <int>[1, 2, 3, 4, 5];
var newObject = list.dropRight(); // newObject = [1, 2, 3, 4];

var list = <int>[1, 2, 3, 4, 5];
var newObject = list.dropRight(3); // newObject = [1, 2];

var list = <int>[1, 2, 3];
var newObject = list.dropRight(5); // newObject = []; // does not throw error :D
```

### dropRightWhile
starts `removing elements` from the `ending of list` until condition becomes `false`.
```dart
var list = <int>[2, 1, 3, 4, 5];
list.dropRightWhile((element) => element >= 3); // list = [2, 1];
```

### dropWhile
starts `removing elements` from the `starting of list` until condition becomes `false`
```dart
var list = <int>[2, 1, 3, 4, 5];
list.dropWhile((element) => element <= 3); // list = [4, 5];
```

### flatten
`Flattens` list a single level deep.

It returns `newObject` of flattened list and does not affects the list object called-upon
```dart
var list = [2, [1, 3], [4, [1, [2]] ] ];
var newList = list.flatten(); // newList = [2, 1, 3, 4, [1, [2] ] ];
```

### flattenDepth
`Recursively flatten list up to depth times.`

It returns `newObject` of flattened list and does not affects the list object called-upon
```dart
var list = [2, [1, 3], [4, [1, [2]] ] ];
var newList = list.flattenDepth(1); // newList = [2, 1, 3, 4, [1, [2] ] ];
```

### flatterDeep
`Recursively flattens list.`

It returns `newObject` of deeply flattened list and does not affects the list object called-upon.
```dart
var list = [2, [1, 3], [4, [1, [2]] ] ];
var newList = list.flattenDeep(); // newList = [2, 1, 3, 4, 1, 2];
```

### chunk
Creates a new list of elements split into groups the length of `size`.

If `list` can't be split evenly, the final chunk will be the remaining elements.
```dart

// It returns new Object of Chunked data;
var list = ['a', 'b', 'c', 'd'];

var newChunkedList = list.chunk(3);// newChunkedList = [['a', 'b', 'c'], ['d']];
```

### compact
Creates an list of elements where the values of the list are not `Falsey`.

Avoid calling it on fixed-length list.
```dart
//It alters the list object if the list is not fixed-length list.
var list = ['a', null, '', false, 'b'];
var compactedData = list.compact(); // ['a', 'b'];

//It returns new Object of compacted data;
var list = ['a', null, '', false, 'b'];
//here the list object is not altered
var compactedData_new_object = compact(list); // ['a', 'b'];
```

### heapSort
Sorts the list in `O(nLog(n))` time complexity.
```dart

var list = <int>[97, 4, 5, 26, 6];
// With `inPlace` set to `false` it returns new sorted list.
var newSortedList = list.heapSort(inPlace: false);
// newSortedList = [4, 5, 6, 26, 97];

var list = <int>[97, 04, 5, 26, 6];
// With `inPlace` set to `true (default)` it sorts the list in its place.
list.heapSort(); // list = [4, 5, 6, 26, 97];
```

## Number Operations
### >>> (mimic)
As dart don't have `>>>`. So to achieve functionality of `>>>` a mimic can be used.

```dart
// 20 >>> 3 = 6
var value = 20.zeroFillRightShift(3); // value = 6
```

### zeroFillRightShift(int number, int amount)
As operator `>>>` is not available in dart, So `zeroFillRightShift` function helps to mimics the working of `>>>`.
```dart
// var t = 20 >>> 3;
var t = zeroFillRightShift(20, 3); // 6

// Thus above function helps to provide operation of `>>>`

// 20 >>> 3 = 6
var value = 20.zeroFillRightShift(3); // value = 6
```

### xor
It returns `xor` operation.
```dart
// 20 ^ 3 = 23
var value = 20.xor(3); // value = 23
```

### divide
It returns `quotient` as integer on divison.
```dart
// ( In Python ) -> [20 // 10 = 2]
// ( In Dart )   -> [20 / 10 = 2.0] (oops) :p

// But we need 2 as result.
var value = 20.divide(10);       // value = 2
var value = 20.divide(10.0);     // value = 2
var value = (20.0).divide(10);   // value = 2
var value = (20.0).divide(10.0); // value = 2
var dividend = 20;
var divisor = 10;
var value = dividend.divide(divisor); // value = 2
```

## String Operations
### slice
Creates a slice of `string` from `start` up to, but not including, `end`.
```dart
var string = '__justkawal;

// It slices the string and returns modified string
var slicedString string.slice(2); // slicedString = 'justkawal';
```

### enumVal
Returns the `value` of the `enum`
```dart
enum justkawal {
  just,
  kawal,
}
'${justkawal.just}'.enumVal; // just
'${justkawal.kawal}'.enumVal; // kawal
```

### toNumber
Returns converted number
```dart
'2604 '.toNumber; // 2604
'  26.04 '.toNumber; // 26.04
```

### count
`Counts` and `returns` the number of occurrences of value.
```dart
'justkawal'.count('a');       // 2
'justkawal'.count('just');    // 1
'justkawal'.count('flutter'); // 0
```

### isNumber
Returns `true`, if the `string` is `number` other-wise `false`
```dart
'123'.isNumber; // true
'justkawal'.isNumber; // false
```

### isBinary
Returns `true` if the `string` is `binary`, other-wise `false`
```dart
'1010'.isBinary; // true
'justkawal'.isBinary; // false
```

### isDecimal
Returns `true` if the `string` is `decimal`, other-wise `false`
```dart
'123'.isDecimal; // true
'justkawal'.isDecimal; // false
```

### isOctal
Returns `true` if the `string` is `octal`, other-wise `false`
```dart
'123'.isOctal; // true
'justkawal'.isOctal; // false
```

### isHex
Returns `true` if the `string` is `good hex`, other-wise `false`
```dart
'123'.isHex; // true
'justkawal'.isHex; // false
```

### deburr
Converts string from `Latin-1` to normal `basic latin letters`.
```dart
'hey kàwàl'.deburr; // hey kawal
```

### unicodeWords
Returns list of `unicode words` from the string.
```dart
'hey kàwàl'.unicodeWords; // [kàwàl]
```

### asciiWords
Returns list of `ascii words` from the string.
```dart
'hey kàwàl'.asciiWords; // [hey]
```

### hasUnicodeWord
Returns `true` if string contains any occurence of `unicode word` other-wise `false`.
```dart
'hey kàwàl'.hasUnicodeWord; // true
'hey'.hasUnicodeWord;      // false
```

### capitalize
Converts the first character of string to `upper case` and the remaining to `lower case`.
```dart
'justkawal'.capitalize; // Justkawal
'JUSTKAWAL'.capitalize; // Justkawal
```

### lowerFirst
Converts the first character of string to `lower case`.
```dart
'Justkawal'.lowerFirst; // justkawal
'JUSTKAWAL'.lowerFirst; // jUSTKAWAL
```

### upperFirst
Converts the `first character` of string to `upper case`.
```dart
'justkawal'.upperFirst; // Justkawal
'jUSTKAWAL'.upperFirst; // JUSTKAWAL
```

### words
Returns `list of words`
```dart
'kàwàl vu'.words; // ['kàwàl', 'vu']
```

### Case Conversions

### camelCase
Converts the string to `camelCase` and returns it.
```dart
'___just__kawal__'.camelCase; // justKawal
'  just  Kawal  '.camelCase; // justKawal
'-----just--Kawal--'.camelCase; // justKawal
```

### kebabCase
Converts the string to `kebabCase` and returns it.
```dart
'___hello__world__'.kebabCase(); // hello-world
'  hello  World  '.kebabCase(); // hello-world
'-----hello--world--'.kebabCase(); // hello-world
```

### lowerCase
Converts the string to `lowerCase` and returns it.
```dart
'___hello__world__'.lowerCase(); // hello world
'  hello  World  '.lowerCase(); // hello world
'-----hello--world--'.lowerCase(); // hello world
```

### snakeCase
Converts the string to `snakeCase` and returns it.
```dart
'___hello__world__'.snakeCase(); // hello_world
'  helloWorld  '.snakeCase(); // hello_world
'-----hello--world--'.snakeCase(); // hello_world
```

### nameCase
Converts the string to `nameCase` and returns it.
```dart
'___kaWaljeet__sInGH__'.nameCase(); // Kawaljeet Singh
'  justKawal  '.nameCase(); // Just Kawal
'-----kawaljeet--singh--'.nameCase(); // Kawaljeet Singh
```

### repeat
Returns `repeated string`, `n` number of times
```dart
'justkawal'.repeat(1); // justkawal
'123'.repeat(2); // 123123
'1'.repeat(5); // 11111
```

### pad
Pads the string on the left and right sides if it's shorter than `length`.

Padding characters will be truncated if they can't be evenly divided by `length`.
```dart
var pad1 = 'abc'.pad(8); // '  abc   '

var pad2 = 'abc'.pad(8, '=_'); // '=_abc=_='

var pad3 = 'abc'.pad(3); // 'abc'
```

## Features coming in next version
On-going implementation for future:
- Some more Functions

## Donate (Be the First one)
- patreon: https://patreon.com/justkawal
