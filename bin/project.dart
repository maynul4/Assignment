// import 'dart:io';
// class myclass {
//   List myList = [];
//
//   func(){
//
//     int sum = 0 ;
//
//     for (int i = 0; i<myList.length;i ++ ){
//
//      sum = sum + int.parse(myList[i]);
//
//      }
//
//     print(sum);
//
//   }
//
//
//
//
// }
//
// void main(){
//   myclass info = myclass();
//
//   info.myList = stdin.readLineSync()!.split(' ');
//
//   // print(info.myList);
//   info.func();
//
// }

import 'dart:io';
abstract class displayRole{
  role(String role){

  }

}
// B. Create a class Person:
class person implements displayRole{
  // Include attributes for name, age, and address.
  String? name;
  int? age;
  String? address;

// Include a reference to the Role interface.
// Provide a constructor and getter methods for the attributes.
  person(this.name, this.age, this.address);

  @override
  role(String role) {
    print('Role: $role');
  }



}

// C. Create a class Student that extends Person:

class student extends person{

// Include additional attributes for studentID, grade, and a list to store courseScores.
  dynamic studentID;
  String? grade;
  List courseScore;

// Provide a constructor to initialize attributes.
  student(super.name, super.age,super.address, {
    required this.studentID,  this.grade, required this.courseScore
  });

  @override
  role(String role){
    print('Role $role');

  }

  calAvg(){
    int sum =0;

    for(int i = 0; i<courseScore.length;i++){
      sum = sum+ int.parse(this.courseScore[i]);
    }
    return sum/courseScore.length;
  }





}

void main(){

  student info = student(
      func ('Name')!,
      funcNum('age')!,
      func ('Address')!,
      studentID: func ('studentID')!,
      grade:func ('grade')!,
      courseScore: funcList('Score like 1,2,3')
  );

      info.role(func ( 'Role'));
      print('Avg: ${info.calAvg()}');


}


func (String Attribute){
  print('Enter your $Attribute');
  String x = stdin.readLineSync()!;
  return x;
}

funcNum (String Attribute){
  print('Enter your $Attribute');
  int x = int.parse(stdin.readLineSync()!);
  return x;
}
funcList (String Attribute){
  print('Enter your $Attribute');
  List x = stdin.readLineSync()!.split(',');
  return x;
}