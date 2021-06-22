main(List<String> args) {
  var num = 7;

  // 正常除法
  print(num / 3);
  // 整除操作
  print(num ~/ 3);
  // 求余
  print(num % 3);

  // ??= 赋值操作,
  // 1. 当变量为Null时, 赋值
  // 2. 当变量有值时, 不赋值
  var name1 = 'sce';
  print(name1);
  var name2 = 'zaj';
  name2 ??= 'lala';
  print(name2);
  var name3;
  name3 ??= 'cool';
  print(name3);

  // 条件运算符
  var temp = 'sce';
  var name;
  name = temp ?? 'zaj';
  print(name);
}
