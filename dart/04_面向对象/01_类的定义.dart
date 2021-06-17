main(List<String> args) {
  var p = Person.withNameAgeHeight('sce', 18, 188.5);
}

class Person {
  String name;
  int age;
  late double height;

  Person(this.name, this.age);

  // 命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);
}
