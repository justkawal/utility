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
  utility:
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

````dart
import 'package:utility/utility.dart';
````

# Usage

## List Operations
### slice
Creates a slice of `list` from `start` up to `end`[exclusive].
  
```dart
var list = [1, 2, 3, 4];
  
// It slices the list elements and hence modifies the list
list.slice(2); // list = [3, 4]
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
returns `true` if it is `Growable list` otherwise `false`.
```dart

// On Non-Growable List
var list = List<dynamic>(8);
var value = list.isGrowable; // false

// On Growable List
var list2 = List<dynamic>();
var value2 = list2.isGrowable; // true
```

### drop
removes `n` number of elements from the beginning of list

```dart
var list = <int>[1, 2, 3, 4, 5];
list.drop(); // list = [2, 3, 4, 5];

var list = <int>[1, 2, 3, 4, 5];
list.drop(3); // list = [4, 5];

var list = <int>[1, 2, 3];
list.drop(5); // list = []; // does not throw error :D
```

### dropRight
removes `n` number of elements from the ending of list.

```dart
var list = <int>[1, 2, 3, 4, 5];
list.dropRight(); // list = [1, 2, 3, 4];

var list = <int>[1, 2, 3, 4, 5];
list.dropRight(3); // list = [1, 2];

var list = <int>[1, 2, 3];
list.dropRight(5); // list = []; // does not throw error :D
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
// It alters the list object if the list is not fixed-length list.
var list = ['a', null, '', false, 'b'];
list.compact(); // ['a', 'b'];

// It returns new Object of compacted data;
var list = ['a', null, '', false, 'b'];
// here the list object is not altered
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

## Features coming in next version
On-going implementation for future:
- Some more Functions

### Donate

  - [Paypal](https://www.paypal.me/kawal7415)
