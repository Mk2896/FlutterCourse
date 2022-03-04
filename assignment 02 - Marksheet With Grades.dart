void main() {
  String name = "Muhammad Maaz Khan";
  String className = "V";
  String section = "A";
  int maths = 98;
  int english = 76;
  int physics = 92;
  int chemistry = 83;
  int urdu = 87;
  String mathsGrade = getGrades(maths);
  String englishGrade = getGrades(english);
  String physicsGrade = getGrades(physics);
  String chemistryGrade = getGrades(chemistry);
  String urduGrade = getGrades(urdu);
  int obtainedMarks = maths + english + physics + chemistry + urdu; 
  int totalMarks = 500;
  double percentage = (obtainedMarks / totalMarks) * 100;
  String totalGrades = getGrades(percentage);
  
  print("-----------------------------------------------------------");
  print("|                FINAL EXAMINATION MARKSHEET              |");
  print("-----------------------------------------------------------");
  print("| Name    : "+name+"                            |");
  print("| Class   : "+className+"                                             |");
  print("| Section : "+section+"                                             |");
  print("-----------------------------------------------------------");
  print("| Subjects | Maths | English | Physics | Chemistry | Urdu |");
  print("|  Marks   |  "+maths.toString()+"   |    "+english.toString()+"   |    "+physics.toString()+"   |     "+chemistry.toString()+"    |  "+urdu.toString()+"  |");
  print("|  Grades  |   "+mathsGrade+"  |    "+englishGrade+"    |    "+physicsGrade+"   |     "+chemistryGrade+"    |  "+urduGrade+"  |");
  print("-----------------------------------------------------------");
  print("|       Total Marks : "+totalMarks.toString()+"    |  Obtained Marks : "+obtainedMarks.toString()+"      |");
  print("|       Percentage  : "+percentage.toString()+"%  |      Grade      : "+totalGrades+"       |");
  print("-----------------------------------------------------------");
}

String getGrades(percentage)
{
  String grade = "";
  if(percentage <= 100 && percentage >= 80)
  {
    grade = "A+";
  }
  else if(percentage < 80 && percentage >=70)
  {
    grade = "A";
  }
  else if(percentage < 70 && percentage >=60)
  {
    grade = "B";
  }
  else if(percentage < 60 && percentage >=50)
  {
    grade = "C";
  }
  else if(percentage < 50 && percentage >=40)
  {
    grade = "D";
  }
  else{
    grade = "F";
  }
  
  return grade;
}