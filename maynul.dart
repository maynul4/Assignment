// import 'dart:io';
// class prac {
//   List courseScore = [];
//
//   calAvg(){
//     int sum =0;
//     for(int i = 0; i<courseScore.length;i++){
//       sum = sum + int.parse(courseScore[i]);
//
//     }
//     return sum/courseScore.length;
//
//   }
// }
//
// void main(){
//   prac info= prac();
//   print('enter your info');
//   info.courseScore = stdin.readLineSync()!.split(',');
//
//   print(info.calAvg());
//
//
//
//
// }

// import 'dart:io';
// class prac {
//   List coursesThought = [];
//
//   course_Thought(){
//     print('Enter course Thought');
//     this.coursesThought = stdin.readLineSync()!.split(',');
//   }
// }
//
// class man {
//
//
//
// }
//
//
// void main (){
//   prac info= prac();
//   info.course_Thought();
//   print(info.coursesThought);
//
// }

// import 'dart:io';
// class prac {
//   List y = [];
//   prac  (y);
// }
// func(String attribute){
//   print('Enter $attribute seperated by comma');
//   List x = stdin.readLineSync()!.split(',');
//   return x;
// }
//
//
//
//
// void main (){
// prac info= prac(func("Score"));
// print(info.y);
//
//
//
// }

// import 'dart:io';
//
// class x {
//   List? courseScore;
//
//   x(this.courseScore);
//
//   calavg(){
//     int sum = 0;
//
//     for (int index = 0; index<courseScore!.length; index++){
//       sum += int.tryParse(courseScore![index])!;
//     }
//     var avg = (sum/courseScore!.length).toStringAsFixed(2);
//     return avg;
//
//   }
// }
//
// void main(){
//   x info = x(stdin.readLineSync()!.split(','));
//
//   print(info.calavg());
// }


// class avg{
//
//   List courseScore = [];
//
//   avg(this.courseScore);
//
//   calAvg(){
//    int? sum = 0;
//     for(int index = 0; index<courseScore.length; index++){
//       sum = sum! + courseScore[index] as int;
//     }
//     var avg = (sum!/courseScore.length).toStringAsFixed(2);
//     return avg ;
//
//
//   }
//
// }
//
// main(){
//   avg info =avg([1,2,3,4]);
//
//   print(info.calAvg());
// }

class x {
  List? score ;
  x(this.score);

  calavg(){
    num sum = 0;
    for (var x in score!){
      sum = (sum + x)/score!.length;
    }
    return sum.toStringAsFixed(2);

  }


}

void main(){


  x info = x([1,2,3]);
  print(info.calavg());

}