main(List<String> args) {
  final p = Person();

  // 直接访问属性
  p.name = 'sce';
  print(p.name);

  // 通过getter和setter访问
  p.setName = 'hanmeimei';
  print(p.getName);
}

class Person {
  late String name;

  set setName(String name) {
    this.name = name;
  }

  String get getName {
    return name;
  }
}
