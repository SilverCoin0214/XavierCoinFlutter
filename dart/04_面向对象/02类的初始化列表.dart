import 'dart:math';

main(List<String> args) {
  var p = Person('sce', age: 88);
  print(p.name);
  print(p.age);

  var point = Point(20, 30);
  print(point);
}

const temp = 20;

class Person {
  final String name;
  final int age;

  // Person(this.name, {int age = 22}) : this.age = age {}

  Person(this.name, {int? age}) : this.age = temp > 20 ? 30 : 50 {}
}

class Point {
  final num x;
  final num y;
  final num distance;

  Point(this.x, this.y) : distance = sqrt(x * x + y * y);

  @override
  String toString() {
    return ('x = $x y = $y distance = $distance');
  }
}
