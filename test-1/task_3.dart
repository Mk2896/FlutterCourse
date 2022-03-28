import 'dart:io';

void main() {
  bool loopFlag = true;
  List<int> Series = [];
  int sum = 0;
  while (loopFlag) {
    stdout.write("Enter Number Of Series To Sum Or Write e To Exit: ");
    String number = stdin.readLineSync()!;
    int? isNumber = int.tryParse(number);
    if (isNumber != null) {
      Series.add(isNumber);
    } else if (number == "e") {
      loopFlag = false;
    } else {
      print("Invalid Number.. Not Added To List Try A Valid Number");
    }
  }

  if (Series.length > 0) {
    sum = Series.reduce((value, element) => value + element);
  }
  print("The Sum of series is: ");
  print("$Series = $sum");
}
