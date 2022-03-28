import 'dart:io';

void main() {
  stdout.write('Enter Number: ');
  int? number = int.tryParse(stdin.readLineSync()!);
  if (number == null) {
    print("Invalid Number! Try Again..");
    main();
    exit(500);
  }

  int factorial = 1;
  for (var i = 2; i <= number; i++) {
    factorial *= i;
  }

  print("Factorial of $number is $factorial");
}
