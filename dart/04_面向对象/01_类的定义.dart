main(List<String> args) {
  var p = Person.withNameAgeHeight('sce', 18, 188.5);
  p.eat();
  print(p);
  var p2 = Person('zaj', 22);
  print(p2);

  var p3 = Person.fromMap({'name': 'zaj', 'age': 28});
}

class Person {
  Object? name;
  Object? age;
  late double height;

  // 当类中没有明确定义构造方法时, 将默认拥有一个无参的构造方法.
  // 1. 当有了自己的构造方法时, 默认的构造方法将会失效,
  Person(this.name, this.age);

  // 命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  // TODO:
  // 这里类型定义没搞懂, 为什么定义object的没有包含String或者Int类型.
  Person.fromMap(Map<String, Object?> map) {
    this.name = map['name'];
    this.age = map['age'];
  }

  // 在方法中使用成员属性时, 可以省略this, 但是如果存在命名冲突, this不能省略.
  eat() {
    print('$name在吃东西');
  }

  @override
  String toString() {
    return 'name=$name age=$age';
  }
}
