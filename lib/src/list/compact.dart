part of utility;

List<T> compact<T>(List<T> list) {
  var temporaryList = List<T>.from(list);
  return temporaryList.where((element) {
    return !isFalsey(element);
  }).toList();
}
