main(List<String> args) {

  // 写法1:
  var q1 = const Person('zaj');
  var q2 = const Person('zaj');
  print(identical(q1, q2));

  // 写法2:
  const p1 = Person('sce');
  const p2 = Person('sce');
  print(identical(p1, p2));
}

class Person {
  final String name;

  // const定义的构造函数, 最终定义的对象如果参数相同, 最终指向的是同一个对象.
  // 注意点1: 拥有常量构造方法的类中, 所有的成员变量必须是用final修饰的.
  // 注意点2: 为了可以通过常量构造方法, 创建出相同的对象, 不能再使用new关键字, 而是使用const关键字.
  //         如果是将结果赋值给const修饰的标识符时, const可以省略.
  const Person(this.name);
}
