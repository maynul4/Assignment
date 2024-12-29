abstract class role{

  void displayrole()

  {  }

}

class person implements role
{
  String ? name;
  int ? age;
  String ? address;
  person(this.name, this.age , this.address);
  @override
  void displayrole(){
  }

}
class student extends person implements  role {

  String ? studentid;
  String ? grade;
  List<int>coursescore = [];

  student(this.studentid, this.coursescore):super('Jhon doo', 23, 'Main road');

  calAvg() {
    int? sum = 0;
    for (int index = 0; index < coursescore.length; index++) {
      sum = sum! + coursescore[index] as int;
    }
    var avg = (sum! / coursescore.length).toStringAsFixed(2);
    return avg!;
  }
}

class teacher extends person implements role
{
  String teacherid;
  List<String>coursesTaught=[];
  teacher(this.teacherid ,this.coursesTaught):super('Mrs. Smith' ,35,'456 Oak St');

  printCourseThought(){
    for(int index = 0; index<coursesTaught.length; index++){
      print ('- ${coursesTaught[index]}');
    }
  }

}

main()
{
  var obj1=teacher('222', ['bangla','English', 'math']);
  obj1.printCourseThought();

  // print(obj1.printCourseThought());

}