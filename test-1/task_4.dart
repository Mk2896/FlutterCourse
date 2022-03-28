import 'dart:io';

void main() {
  List<int> Series = [1, 3, 3, 7, 4, 3, 2, 3, 3];
  var max = 0;
  var number = 0;
  for (int item in Series) {
    int length = Series.where((element) => item == element).toList().length;
    if (max < length) {
      max = length;
      number = item;
    }
  }

  print("The Most Occured Number In The Series Is: $number");
}
