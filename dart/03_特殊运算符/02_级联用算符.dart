main(List<String> args) {
  var p = Person('sce')
    ..eat()
    ..run();

  print(p.name);
}

class Person {
  String name;

  Person(this.name);

  void run() {
    print("runnig");
  }

  void eat() {
    print('eating');
  }
}
