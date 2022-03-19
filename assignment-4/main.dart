import 'dart:io';

void main() {
  stdout.write(
      "Enter Question Number To Execute Code For Of That Question or EXIT to exit code: ");
  String? question = stdin.readLineSync()?.toLowerCase();
  switch (question) {
    case "1":
      start_code("1");
      question_1();
      break;
    case "2":
      start_code("2");
      question_2();
      break;
    case "3":
      start_code("3");
      question_3();
      break;
    case "4":
      start_code("4");
      question_4();
      break;
    case "5":
      start_code("5");
      question_5();
      break;
    case "6":
      start_code("6");
      question_6();
      break;
    case "7":
      start_code("7");
      question_7();
      break;
    case "8":
      start_code("8");
      question_8();
      break;
    case "9":
      start_code("9");
      question_9();
      break;
    case "10":
      start_code("10");
      question_10();
      break;
    case "11":
      start_code("11");
      question_11();
      break;
    case "12":
      start_code("12");
      question_12();
      break;
    case "13":
      start_code("13");
      question_13();
      break;
    case "14":
      start_code("14");
      question_14();
      break;
    case "exit":
      break;
    default:
      print("Invalid Question Number Please Try Again");
      main();
  }
}

void start_code(String text) {
  print("---------------------------------------------------------------");
  print("                          Question $text");
  print("---------------------------------------------------------------");
}

void end_code() {
  print("---------------------------------------------------------------");
  print("---------------------------------------------------------------");
  main();
}

void question_1() {
  final List<dynamic> _nameList = [
    'Bilal',
    'Bilal',
    'Bilal',
    'Owais',
    'Owais',
    'Owais'
  ];

  List distinctList = _nameList.toSet().toList();
  print(distinctList);
  end_code();
}

void question_2() {
  var a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  var b = a.where((e) => e % 2 == 0).toList();
  print(b);
  end_code();
}

void question_3() {
  stdout.write("Enter Number To Check Wether Its Prime Or Not: ");
  int number = int.parse(stdin.readLineSync().toString());
  bool isPrime = true;
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      isPrime = false;
      break;
    }
  }

  if (isPrime) {
    print("$number Is A Prime Number");
  } else {
    print("$number Is Not A Prime Number");
  }
  end_code();
}

void question_4() {
  for (int i = 1; i <= 15; i++) {
    print("7 X $i = ${7 * i}");
  }
  end_code();
}

void question_5() {
  var fruits = ["apple", "banana", "mango", "orange", "strawberry"];
  fruits.forEach((element) {
    print(element);
  });
  end_code();
}

void question_6() {
  for (int i = 1; i <= 100; i++) {
    print("5 X $i = ${5 * i}");
  }
  end_code();
}

void question_7() {
  var celsius = 14;
  var farenhite_converted = (celsius * 9 / 5) + 32;
  print("$celsius oC is ${farenhite_converted.toStringAsFixed(2)} oF");

  var farenhite = farenhite_converted;
  var celsius_converted = (farenhite - 32) * 5 / 9;
  print("$farenhite oF is ${celsius_converted.toStringAsFixed(2)} oC");
  end_code();
}

void question_8() {
  var firstNum;
  var secondNum;
  var operator;
  List<String> validOperators = ['+', '-', '*', '/', '~/', '%'];
  bool firstNumFlag = true;
  bool secondNumFlag = true;
  bool operatorFlag = true;
  var result;

  while (operatorFlag) {
    stdout.write("Enter Operator: ");
    operator = stdin.readLineSync().toString();
    if (validOperators.contains(operator)) {
      operatorFlag = false;
    }
  }

  while (firstNumFlag) {
    stdout.write("Enter First Number: ");
    firstNum = int.tryParse(stdin.readLineSync().toString());
    if (firstNum != null) {
      firstNumFlag = false;
    }
  }

  while (secondNumFlag) {
    stdout.write("Enter Second Number: ");
    secondNum = int.tryParse(stdin.readLineSync().toString());
    if (secondNum != null &&
        !(secondNum == 0 &&
            (operator == "/" || operator == "~/" || operator == '%'))) {
      secondNumFlag = false;
    }
  }

  if (operator == "+") {
    result = firstNum + secondNum;
  } else if (operator == "-") {
    result = firstNum - secondNum;
  } else if (operator == "*") {
    result = firstNum * secondNum;
  } else if (operator == "/") {
    result = firstNum / secondNum;
  } else if (operator == "~/") {
    result = firstNum ~/ secondNum;
  } else if (operator == "%") {
    result = firstNum % secondNum;
  }

  print(result);
  end_code();
}

void question_9() {
  String character = "";
  List vowels = ['a', 'e', 'i', 'o', 'u'];
  while (character.length != 1) {
    stdout.write("Enter Character to check whether its vowel or not: ");
    character = stdin.readLineSync().toString().toLowerCase();
  }
  bool isVowel = vowels.contains(character);
  isVowel ? print("Character is a Vowel") : print("Character is a Consonant");
  end_code();
}

void question_10() {
  stdout.write("Enter String: ");
  String text = stdin.readLineSync().toString();
  print(text.split("").reversed.join(""));
  end_code();
}

void question_11() {
  List<dynamic> _nameList = [
    'Ahmed',
    'Bilal',
    'Muhammad',
    'Owais',
    'Muhmmad',
    'Ali',
    'Ahmed'
  ];

  _nameList = _nameList.toSet().toList();
  print(_nameList);
  end_code();
}

void question_12() {
  var list = [for (var i = 5; i <= 100; i += 2) i]..add(100);
  List<int> missing_list = [];
  var diff = 1;
  print("Provided List: ");
  print(list);

  print("Following Number are Missing in the List: ");
  for (int i = 0; i < list.length; i++) {
    while (diff < list[i] - i) {
      missing_list.add(diff + i);
      diff++;
    }
  }
  print(missing_list);
  end_code();
}

void question_13() {
  var list = [14, 190, 2, 4, 5, 89, 23, 65];
  list.sort();
  int min = list.first;
  int max = list.last;
  print("The Min Number is $min And The Max Number is $max");
  end_code();
}

void question_14() {
  var sum;
  bool sumFlag = true;
  List list = [1, 4, 6, 9, 19, 23, 12, 56, 11, 8, 20, 16];
  List<List> pair = [];
  while (sumFlag) {
    stdout.write("Enter Sum To Find Pair: ");
    sum = int.tryParse(stdin.readLineSync().toString());
    if (sum != null) {
      sumFlag = false;
    }
  }

  for (int i = 0; i < list.length; i++) {
    for (int j = i + 1; j < list.length; j++) {
      if (list[i] + list[j] == sum) {
        pair.add([list[i], list[j]]);
      }
    }
  }

  print(list);
  print(
      "There are ${pair.length} Pairs That add up to $sum.. That Are Listed Below");
  print(pair);
  end_code();
}
