import 'dart:io';
class displayRole{
  role(String role){
  }
}
class person{

  String? name;
  int? age;
  String? address;
  person(this.name, this.age, this.address);
  @override
  displayRole(String role){
  }
}
class student extends person{
  String studentID;
  String? grade;
  List courseScore = [];
  student(super.name, super.age, super.address , {
    required this.grade, required this.studentID,  required this.courseScore
  });
  @override
  role(String role){
    print('Role: $role');
  }
  calAvg(){
   int sum =0;
   for(int i = 0; i<courseScore.length;i++){
     sum = sum+ int.parse(this.courseScore[i]);
   }
   return (sum/courseScore.length);
  }
  calGrade(){
    if(calAvg()>=80){
      return 'A+';
    }else if(calAvg() >=70){
      return'A';
    }else if(calAvg() >=60){
      return 'A-';
    }else if(calAvg() >=50){
      return'B';
    }else if(calAvg() >=40){
      return 'C';
    }else if(calAvg() >=33){
      return 'D';
    }else{
      return 'Fail';
    }
  }
}
class Teacher extends person{
  String? teacherId;
  List coursesThought = [];
  Teacher(super.name, super.age, super.address, {
    required this.teacherId, required this.coursesThought
  });
@override
  displayRole(String role){
  print('Role: $role');
}
  course_Thought(){
  print('Enter course Thought');
  this.coursesThought = stdin.readLineSync()!.split(',');
  }
  coursethoughtp(){
  for(int index = 0 ; index <coursesThought.length; index++){
    print(coursesThought[index]);
  }
  }
}
class studentManagement {
  studentManagement (String role){
    student callGrade = student('name', 1, 'address', grade: 'grade', studentID: "studentID", courseScore: []);
    var Grade = callGrade.calGrade();
    if(role == 'Student'|| role == 'student' || role== 'STUDENT'){
      student info = student(input('name'), input('age'),input('address') , studentID: input('studentID'), grade: Grade, courseScore: input('Course Score'));
      print('===========================================');
      print('Student Information:');
      print('Role: $role');
      print('Name: ${info.name}');
      print('Age: ${info.age}');
      print('Address: ${info.address}');
      print('Avreage Score ${info.calAvg()}');
      var x =  info.calGrade();
    }else if(role == 'Teacher'||role=='teacher'||role=='TEACHER'){
      Teacher info = Teacher(input('name'), input('age'), input('address'), teacherId: input('teacherId'), coursesThought: input('coursesThought'));
      print('===========================================');
      print('Role: $role');
      print('Name: ${info.name}');
      print('Age: ${info.age}');
      print('Address: ${info.address}');
      print('Course Thought :');
      info.coursethoughtp();

    }else{
      print('incorrect Role Choose a role between Student and Teacher');
    }
  }
}
input(String Attricbute) {
  print('Enter your $Attricbute');
  if (Attricbute == 'name' ||
      Attricbute == 'address' ||
      Attricbute == 'studentID' ||
      Attricbute == 'teacherId'
  ) {
    var input = stdin.readLineSync()!;
    return input;
  } else if (Attricbute == 'age') {
    var input = int.tryParse(stdin.readLineSync()!);
    return input;
  } else if (Attricbute == 'Course Score' || Attricbute == 'coursesThought') {
    print('like 1,2,3 or A,B,C');
    List input = stdin.readLineSync()!.split(',') ;
    return input;
  } else{
    print('Incorrect Role');
  }
}
void main(){

  try{
    print('Enter your role: Student/Teacher');
    func(){
      String? role = stdin.readLineSync()!;
      return role;
    }
    studentManagement info = studentManagement(func());
  }catch(e){
    print('!== Error == Error == Error == Error ==!');
    print('!======================================!');
    print('===========  Invalid input  ================');
    print('!======================================!');
    print('!== Error == Error == Error == Error ==!');
  }
}









