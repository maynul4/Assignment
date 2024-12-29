abstract class Role {
displayRole();
}//role



class person implements Role{
  String? name;
  int? age;
  String? address;

  Role? role;

  person( this.name, this.age, this.address);

  //unnecessary
    String? get getName => name;
  int? get getAge => age;
  String? get getAddress => address;
  Role? get getRole => role;
  //unnecessary

  @override
  displayRole(){
    displayRole();
  }
}//person

class student extends person implements Role{ // shishir vai apni ki akhane impliment korsen..?

  String? studentId;
  String? grade;
  List? courseScore;

  student(super.name, super.age, super.address, {required this.studentId, required this.grade, required this.courseScore} );

  @override
  displayRole(){
    print('Role: Student');
  }

  //calculating avgScore

  calavg(){
   int? sum = 0;

   for (int index = 0; index<courseScore!.length; index++){
     sum = sum! + courseScore![index] as int;
   }
   var avg = (sum!/courseScore!.length).toStringAsFixed(2);
   return avg;
  }//calavg
}

class teacher extends person implements Role{
  String? teacherId;
  List? courseThought;

  teacher(super.name, super.age, super.address ,{required this.teacherId, required this.courseThought});

  @override
  displayRole(){
    print('Role: Teacher');
  }

  displayCourseThought(){
    print('Course Thought');
    for(var course in this.courseThought!){
      print('- $course');
    }

  }

}

void main(){
  student Student = student(
      'Maynul',
      23,
      'Main Road',
      studentId: 's1456',
      grade: 'A+',
      courseScore: [80,90,82]
  );

  teacher Teacher = teacher(
      'Rodhim',
      26,
      'Main Road',
      teacherId: 't2345',
      courseThought: ['Bangla','Enlish','Math']
  );

  // Student info
  print('==================');

  print('Student Information');
  Student.displayRole();
  print('Name: ${Student.name}');
  print('Age: ${Student.age}');
  print('Address: ${Student.address}');
  print('Avg Score: ${Student.calavg()}');

  print('==================');

  print('\n');

  print('==================');

  // Teacher info

  print('Teacher information');
  Teacher.displayRole();
  print('Name: ${Teacher.name}');
  print('age: ${Teacher.age}');
  print('Address ${Teacher.address}');
  Teacher.displayCourseThought();
  print('==================');

}








