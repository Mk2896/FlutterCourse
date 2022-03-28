import 'dart:io';

void main() {
  List<int> Series = [7, 9, 5, 11, 7, 4, 12, 6, 2, 11];
  for (var i = 0; i < Series.length - 1; i++) {
    var difference = Series[i] - Series[i + 1];
    print(
        "The distance between ${Series[i]} and ${Series[i + 1]} is: $difference");
  }
}
