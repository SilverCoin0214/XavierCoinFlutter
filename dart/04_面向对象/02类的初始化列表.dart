main(List<String> args) {
  var p = Person('sce');
  print(p.name);
  print(p.age);
}

class Person {
  final String name;
  final int age;

  Person(this.name, {int age = 22}) : this.age = age {}
}
