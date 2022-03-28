import 'dart:io';

void main() {
  stdout.write("Enter Character: ");
  String character = stdin.readLineSync()!;
  if (character.length > 1 || character.length == 0) {
    print("Enter Single Character..");
    main();
    exit(500);
  }

  int? isNumber = int.tryParse(character);
  if (isNumber != null) {
    print("Character '$character' is a number");
  } else {
    int ascii = character.codeUnitAt(0);
    if ((ascii > 64 && ascii < 91) || (ascii > 96 && ascii < 122)) {
      print("Character '$character' is an alphabet");
    } else {
      print("Character '$character' is a special character");
    }
  }
}
