part of utility;

extension UtilityListNum on List<num> {
  ///Sorts the algorithm in `O(nLog(n))` time complexity.
  ///```dart
  ///
  ///var list = <int>[97, 4, 5, 26, 6];
  ///// With `inPlace` set to `false` it returns new sorted list.
  ///var newSortedList = list.heapSort(inPlace: false);
  ///// newSortedList = [4, 5, 6, 26, 97];
  ///
  ///var list = <int>[97, 04, 5, 26, 6];
  ///// With `inPlace` set to `true (default)` it sorts the list in its place.
  ///list.heapSort(); // list = [4, 5, 6, 26, 97];
  ///```
  List<num> heapSort({bool inPlace = true}) {
    if (this == null) {
      return null;
    }
    return _heapSort(inPlace ? this : List<num>.from(this));
  }

  List<num> _heapSort(List<num> list) {
    var length = list.length;
    for (var i = length.divide(2) - 1; i > -1; i--) {
      heapify(list, length, i);
    }
    for (var i = length - 1; i > 0; i--) {
      // ---- start ---- do the switching of the child with the root.
      var temp = list[i];
      list[i] = list[0];
      list[0] = temp;
      // ----- end -----
      heapify(list, i, 0);
    }
    return list;
  }

  void heapify(List<num> list, num length, num i) {
    var largest = i, left = i * 2 + 1, right = i * 2 + 2;

    // check if root is less than left child
    if (left < length && list[i] < list[left]) {
      largest = left;
    }

    // check if root is less than right child
    if (right < length && list[largest] < list[right]) {
      largest = right;
    }

    if (largest != i) {
      // ---- start ---- do the switching of the child with the root.
      var temp = list[i];
      list[i] = list[largest];
      list[largest] = temp;
      // ----- end -----
      heapify(list, length, largest);
    }
  }
}
