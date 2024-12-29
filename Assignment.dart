import 'dart:ffi';

abstract class Role {
  void displayrole();
}//role

class person implements Role{
 String? name;
 int? age;
 String? address;


 Role? role;

 person({required this.name, required this.age, required this.address});

 String get getName => name!;
 int get getAge => age!;
 String? get getAddress => address;

  @override
 displayrole(){

 }

} //person

class Student extends person implements Role{
  String? studentId;
  String? grade;
  List? courseScore;

  Student({
    required super.name,
    required super.address,
    required super.age,
    required this.studentId,
    required this.grade,
    required this.courseScore
  });

  @override
  void displayrole() {
    print('Role: Student');
  }

  calAvg(){
    num sum =0;
    for(var x in courseScore!){
      sum = (sum+x)/courseScore!.length;
    }
    return sum.toStringAsFixed(2);
  }


  //***dynamic result***
// dynamicReasult(){
//
//   num sum =0;
//   for(var x in courseScore!){
//     sum = (sum+x)/courseScore!.length;
//   }

//   if(sum >= 80){
//     print('Grade: A+');
//   }else if(sum >= 70){
//     print('Grade: A');
//   }else if(sum >= 60){
//     print('Grade: A-');
//   }else if(sum >= 50){
//     print('Grade: B');
//   }else if(sum >= 40){
//     print('Grade: C');
//   }else if(sum>= 33){
//     print('Grade: D');
//   }else {
//     print('Grade: Fail!!');
//   }
// }

// ***not mandetory***

} //Student

class Teacher extends person implements Role{
  String? teacherId;
  List? courseThought;

  Teacher({
    required super.name,
    required super.age,
    required super.address,
    required this.teacherId,
    required this.courseThought
});// teacher

  @override
  void displayrole() {
    print('Role: Teacher');
  } //overrideDisplayRole

  displayCourseThought(){
    for(var x in courseThought!){
      print('-$x');
    }
  }//displayCourseThought
}//Teacher

class StudentManagementSystem{
  static void main(){
    Student student = Student(
        name: 'Maynul',
        address: 'Main Road',
        age: 23,
        studentId: 's1456',
        grade: 'A+',
        courseScore: [80,82,90]
    );

    Teacher teacher = Teacher(
        name: 'Rohim',
        age: 30,
        address: 'Road no- 2',
        teacherId: 't2304',
        courseThought: ['Bangla','English','Math']
    );

    print('Student Infromation');
    print('-------------------');

    student.displayrole();
    print('Name: ${student.name}');
    print('Age: ${student.age}');
    print('Address: ${student.address}');
    print('CourseScore ${student.calAvg()}');
    // student.dynamicReasult(); //*** optional field***

    print('\n');
    print('\n');

    print('Teacher Information');
    print('--------------------');
    teacher.displayrole();
    print('Name: ${teacher.name}');
    print('Age: ${teacher.age}');
    print('Address: ${teacher.address}');
    print('Course Thought:');
    teacher.displayCourseThought();
  }
}

//main function

void main(){
  StudentManagementSystem.main();

  StudentManagementSystem syste = StudentManagementSystem();


}
