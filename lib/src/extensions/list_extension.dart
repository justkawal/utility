part of utility;

extension UtilityList<T> on List<T> {
  ///Creates a slice of `list` from `start` up to `end`[exclusive].
  ///
  ///````dart
  ///var list = [1, 2, 3, 4];
  ///
  ///// It slices the list elements and hence modifies the list
  ///list.slice(2); // list = [3, 4]
  ///````
  List<T> slice(int start, [int end]) {
    var length = this?.length ?? 0;
    if (length <= 0) {
      return <T>[];
    }
    start ??= 0;
    end ??= length;

    if (start < 0) {
      start = -start > length ? 0 : (length + start);
    }
    if (end > length) {
      end = length;
    }
    if (end < 0) {
      end += length;
    }
    length = start > end ? 0 : zeroFillRightShift((end - start), 0);
    start = start.zeroFillRightShift(0);

    var index = -1;
    var result = <T>[];
    while (++index < length) {
      result.add(this[index + start]);
    }
    return this;
  }

  // Private function to be accessed for internal usage only
  List<T> _castSlice(int start, [int end]) {
    end ??= length;
    return (start == 0 && end >= length) ? this : /* this. */ slice(start, end);
  }

  /// returns `random value` from list. If list is empty then it returns `null`
  ///
  /// ````dart
  /// var list = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  /// var randomValue = list.random(); // 3 // 3 will not be removed from list
  ///
  /// // If remove = true is passed as argument then polled random item will be removed from list
  /// // before list is
  /// // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  /// var randomValue list.random(remove: true); // 5
  /// // after calling with remove = true
  /// // [1, 2, 3, 4, 6, 7, 8, 9, 10]
  ///
  /// // If secure = true is passed as argument then Random.secure() is used
  /// var randomValue list.random(secure: true); // 5
  /// ````
  T random({bool secure = false, bool remove = false, int seed}) {
    if (/* this. */isEmpty) {
      return null;
    }
    Random random;
    if (secure ?? false) {
      random = Random.secure();
    } else if (seed != null) {
      random = Random(seed);
    } else {
      random = Random();
    }
    var randomIndex = random.nextInt(/* this. */length);
    var item = this[randomIndex];
    if (remove ?? false) {
      /* this. */ removeAt(randomIndex);
    }
    return item;
  }

  /// returns `true` if it is `Growable list` otherwise false.
  ///
  /// ````dart
  /// // On Non-Growable List
  /// var list = List<dynamic>(8);
  /// var isGrowable = list.isGrowable; // false
  ///
  /// // On Growable List
  /// var list2 = List<dynamic>();
  /// var isGrowable = list2.isGrowable; // true
  /// ````
  bool get isGrowable {
    try {
      /* this. */ add(null);
      /* this. */ removeLast();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// removes `n` number of elements from the beginning of list
  ///
  /// ````dart
  /// var list = <int>[1, 2, 3, 4, 5];
  /// list.drop(); // list = [2, 3, 4, 5];
  ///
  /// var list = <int>[1, 2, 3, 4, 5];
  /// list.drop(3); // list = [4, 5];
  ///
  /// var list = <int>[1, 2, 3];
  /// list.drop(5); // list = []; // does not throw error :D
  /// ````
  List<T> drop([int n = 1]) {
    if (n > (/* this. */ length ?? 0)) {
      n = /* this. */ length;
    }
    for (var i = 1; i <= n; i++) {
      /* this. */ removeAt(0);
    }
    return this;
  }

  /// removes `n` number of elements from the ending of list
  ///
  /// ````dart
  /// var list = <int>[1, 2, 3, 4, 5];
  /// list.dropRight(); // list = [1, 2, 3, 4];
  ///
  /// var list = <int>[1, 2, 3, 4, 5];
  /// list.dropRight(3); // list = [1, 2];
  ///
  /// var list = <int>[1, 2, 3];
  /// list.dropRight(5); // list = []; // does not throw error :D
  /// ````
  List<T> dropRight([int n = 1]) {
    if (n > 0) {
      if (n > (/* this. */ length ?? 0)) {
        n = /* this. */ length;
      }
      for (var i = 1; i <= n; i++) {
        /* this. */ removeLast();
      }
    }
    return this;
  }

  /// starts `removing elements` from the `ending of list` until condition becomes `false`
  ///
  /// ````dart
  /// var list = <int>[2, 1, 3, 4, 5];
  /// list.dropRightWhile((element) => element >= 3); // list = [2, 1];
  /// ````
  List<T> dropRightWhile(bool Function(T element) callback) {
    var index = /* this. */ length - 1;
    while (index >= 0) {
      if (!callback(this[index])) {
        break;
      }
      /* this. */ removeLast();
      index--;
    }
    return this;
  }

  /// starts `removing elements` from the `starting of list` until condition becomes `false`
  ///
  /// ````dart
  /// var list = <int>[2, 1, 3, 4, 5];
  /// list.dropWhile((element) => element <= 3); // list = [4, 5];
  /// ````
  List<T> dropWhile(bool Function(T element) callback) {
    var index = 0;
    while (index < length) {
      if (!callback(this[index])) {
        break;
      }
      /* this. */ removeAt(0);
      index++;
    }
    return this;
  }

  /// `Flattens` array a single level deep.
  ///
  /// It returns `newObject` of flattened array and does not affects the list object called-upon
  ///
  /// ````dart
  /// var list = [2, [1, 3], [4, [1, [2]] ] ];
  /// var newList = list.flatten(); // newList = [2, 1, 3, 4, [1, [2] ] ];
  /// ````
  List<T> flatten() {
    var copyList = <Object>[];
    for (var val in this) {
      if (val is List) {
        for (var innerVal in val) {
          copyList.add(innerVal);
        }
      } else {
        copyList.add(val);
      }
    }
    return copyList;
  }

  /// `Recursively flatten array up to depth times.`
  ///
  /// It returns `newObject` of flattened array and does not affects the list object called-upon
  ///
  /// ````dart
  /// var list = [2, [1, 3], [4, [1, [2]] ] ];
  /// var newList = list.flattenDepth(1); // newList = [2, 1, 3, 4, [1, [2] ] ];
  /// ````
  List<T> flattenDepth([int depth = 1]) {
    if (this is List) {
      var copyList = <Object>[];
      for (var val in this) {
        if (depth > 0 && val is List) {
          val.flattenDepth(depth - 1).forEach((element) {
            copyList.add(element);
          });
        } else {
          copyList.add(val);
        }
      }
      return copyList;
    }
    return this;
  }

  /// `Recursively flattens array.`
  ///
  /// It returns `newObject` of deeply flattened array and does not affects the list object called-upon.
  ///
  /// ````dart
  /// var list = [2, [1, 3], [4, [1, [2]] ] ];
  /// var newList = list.flattenDeep(); // newList = [2, 1, 3, 4, 1, 2];
  /// ````
  List<T> flattenDeep() {
    var copyList = <Object>[];
    /* this. */ forEach((element) {
      if (element is List) {
        for (var val in element.flattenDeep()) {
          copyList.add(val);
        }
      } else {
        copyList.add(element);
      }
    });
    return copyList;
  }

  /// Creates a new list of elements split into groups the length of `size`.
  ///
  /// If `list` can't be split evenly, the final chunk will be the remaining elements.
  ///
  /// ````dart
  ///
  /// // It returns new Object of Chunked data;
  /// var list = ['a', 'b', 'c', 'd'];
  ///
  /// var newChunkedList = list.chunk(3);// newChunkedList = [['a', 'b', 'c'], ['d']];
  /// ````
  List<List<T>> chunk([int size = 1]) {
    size ??= 1;
    size = max(size, 0);
    var length = this?.length ?? 0;
    if (length <= 0 || size < 1) {
      return <List<T>>[];
    }
    var index = 0;
    var result = List<List<T>>((length / size).ceil());

    while (index < length) {
      result.add(/* this. */ slice(index, (index += size)));
    }
    return result;
  }

  /// Creates an list of elements where the values of the list are not `Falsey`.
  /// Avoid calling it on fixed-length list.
  ///
  /// ````dart
  /// // It alters the list object if the list is not fixed-length list.
  /// var list = ['a', null, '', false, 'b'];
  /// var compactedData = list.compact(); // ['a', 'b'];
  ///
  /// // It returns new Object of compacted data;
  /// var list = ['a', null, '', false, 'b'];
  /// // here the list object is not altered
  /// var compactedData_new_object = compact(list); // ['a', 'b'];
  ///````
  List<T> compact() {
    /* this. */ removeWhere((element) => isFalsey(element));
    return this;
  }
}
