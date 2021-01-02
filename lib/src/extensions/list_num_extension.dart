part of utility;

extension UtilityListNum on List<num> {

  List<num> heapSort({bool inPlace = true}) {
    if (this == null) {
      return null;
    }
    var length = this.length;
    for (var i = length.divide(2) - 1; i > -1; i--) {
      //heapify();
    }
  }

  void heapify(List<num> list, num length, num i) {
    var largest = i;
    var left = i * 2 + 1;
    var right = i * 2 + 2;

    if(i < length && list[i] < list[largest]){

    }
  }
}