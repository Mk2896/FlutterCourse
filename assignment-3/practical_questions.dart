import 'dart:io';

void main() {
  stdout.write(
      "Enter Question Number To Execute Code For Of That Question or EXIT to exit code: ");
  String? question = stdin.readLineSync()?.toLowerCase();
  switch (question) {
    case "2":
      start_code("2");
      question_2();
      break;
    case "3":
      start_code("3");
      question_3();
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

void question_2() {
  int pricePerTicket = 600;
  print(
      'Cost of buying 5 tickets to a movie would cost: ${pricePerTicket * 5}');
  end_code();
}

void question_3() {
  List list1 = [1, 2, 3, 4, 5, 6, 7];
  List list2 = [3, 5, 6, 7, 9, 10];
  list1.removeWhere((elm) => list2.contains(elm));
  print("The Difference between list 1 & 2 is: $list1");
  end_code();
}

void question_6() {
  List<int> answers = [7, 14, 21, 28, 35, 42, 49, 56, 63, 70];
  List<int> times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  Map<int, int>.fromIterables(times, answers).forEach((time, answer) {
    print('7 X $time = $answer');
  });
  end_code();
}

void question_7() {
  String password = "Ab123456";
  stdout.write("Enter Password: ");
  String? inputPassword = stdin.readLineSync() ?? null;
  if (inputPassword == "") {
    print("Please Enter Your Password");
  } else if (inputPassword != password) {
    print("Incorrect Password");
  } else {
    print("Correct! The Password you entered matches the original password");
  }
  end_code();
}

void question_8() {
  List students = ['Uzair', 'Azher', 'Qasim'];
  List scores = [495, 325, 215];
  print("Student Name | Score | Percentage");
  print("----------------------------------");
  Map.fromIterables(students, scores).forEach((name, score) {
    print("   $name     |  $score  |    ${(score / 500 * 100)}%");
  });
  end_code();
}

void question_10() {
  String city = "Hyderabad";
  print(city.replaceFirst("Hyder", "Islam"));
  end_code();
}

void question_11() {
  String customerName = "Muhammad Maaz Khan";
  String currentMonth = getCurrentMonth(DateTime.now().month);
  num numberOfUnits = 123.45;
  int chargesPerUnit = 102;
  var netAmount = (numberOfUnits * chargesPerUnit).toStringAsFixed(2);
  int latePaymentSurcharge = 100;
  var grossAmount =
      (double.parse(netAmount) + latePaymentSurcharge).toStringAsFixed(2);

  print("Customer Name: $customerName");
  print("Current Month: $currentMonth");
  print("Number Of Units: $numberOfUnits");
  print("Charges Per Unit: $chargesPerUnit");
  print("Net Amount (Before Due Date): $netAmount");
  print("Late Payment Surcharge: $latePaymentSurcharge");
  print("Gross Payment (After Due Date): $grossAmount");
  end_code();
}

void question_12() {
  int today = DateTime.now().day;
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  if (today < 16) {
    for (DateTime index = DateTime(year, month, 1);
        (index.month == month && index.day < 16);
        index = index.add(Duration(days: 1))) {
      print("${index.day}-${index.month}-${index.year}");
    }
  } else {
    for (DateTime index = DateTime(year, month, 16);
        index.month == month;
        index = index.add(Duration(days: 1))) {
      print("${index.day}-${index.month}-${index.year}");
    }
  }
  end_code();
}

String getCurrentMonth(month) {
  switch (month) {
    case 1:
      return "January";
    case 2:
      return "Ferbuary";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
    default:
      return getCurrentMonth(DateTime.now().month);
  }
}
