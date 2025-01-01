import 'dart:ffi';
void main(){
  triangle(num Base, num Height ){
    var area = 0.5*Base*Height;
    print('The area of the triangle is: $area');
  }
  triangle(5, 10);
}