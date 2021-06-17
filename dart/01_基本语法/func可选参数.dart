main(List<String> args) {
  sayHello1('sce');
  sayHello2('zaj', 18);
  sayHello3('lalala', age: 28);
}

// 必选参数
void sayHello1(String name) {
  print(name);
}

// 位置可选参数

void sayHello2(String name, [int age = 10, double height = 1.88]) {
  print(name);
  print(age);
  print(height);
}

// 命名可选参数
void sayHello3(String name, {int age = 10, double height = 1.88}) {
  print(name);
  print(age);
  print(height);
}
