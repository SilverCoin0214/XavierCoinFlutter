main(List<String> args) {
  var p = Person('sce', 18);
  print(p.name);
  print(p.age);
  p.eat();
}

class Animal {
  int age;

  Animal(this.age);

  eat() {
    print('father is eating');
  }
}

// dart中继承使用 extends, 子类中使用super来访问父类
// 父类中所有的成员变量和方法都会被继承, 但是构造方法不会
class Person extends Animal {
  String name;

  // 子类的构造方法在执行前, 将隐含调用父类的无参默认构造方法(没有参数且与类同名的构造方法)
  // 如果父类没有无参默认构造方法, 则子类的构造方法必须在初始化列表中通过super显示调用父类的某个构造方法
  Person(this.name, int age) : super(age) {}

  // 子类可以重写父类的方法
  @override
  eat() {
    print('now child is eating');
  }
}
