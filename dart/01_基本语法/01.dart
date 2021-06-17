// main函数是Dart的唯一入口, 且main没有返回值
// print是输出

main(List<String> args) {
  print("hellot world");

  // final声明常量 , const声明常量, var声明变量

  // Dart中不能判断非0即真, 或者非空即真
  var flag = true;
  print(flag);

  // 1. 明确的声明

  // 2. 类型推倒(var / final / const)

  // const 必须赋值, 并且是在编译期间就有一个确定的值
  // final 可以通过计算/函数获取一个值(运行期间获得的一个值)

  final p1 = Person('sce');

  const p2 = Person('zaj');
  const p3 = Person('zaj');

  print(identical(p2, p3));
}

class Person {
  final String name;

  const Person(this.name);
}
