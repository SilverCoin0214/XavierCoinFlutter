main(List<String> args) {
  final p1 = Person.withName('sce');
  final p2 = Person.withName('sce');

  print(identical(p1, p2));
}

class Person {
  String name;
  String color;


  // 原本的写法不知道为什么会报错, 现在的写法就可以了.
  static final Map _nameCache = <String, Person>{};
  // 这个写法不行
  // static final Map<String, Person> _colorCache = <String, Person>{};

  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final p = Person(name, 'defalut');
      _nameCache[name] = p;
      return p;
    }
  }

  Person(this.name, this.color) {}
}
