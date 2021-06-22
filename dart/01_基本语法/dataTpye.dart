main(List<String> args) {
  // 1. dart中的 int 和 double 可表示的范围并不是固定的, 它取决于运行dart的平台
  int age = 18;
  print(age);

  int hexAge = 0x12;
  print(hexAge);

  double height = 2.55;
  print(height);

  // 字符串与数字之间的转化
  // 1, 字符串转数字
  var one = int.parse('111');
  var two = double.parse('3.1415926');
  print('当前的one的值是${one}, 类型是${one.runtimeType}');
  print('当前的two的值是${two}, 类型是${two.runtimeType}');

  // 2. 数字转字符串
  var num1 = 123;
  var num2 = 12.345;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  print('当前num1Str的值为: $num1Str, 类型为${num1Str.runtimeType}');
  print('当前num2Str的值为: $num2Str, 类型为${num2Str.runtimeType}');

  // 2. dart布尔类型无法判断非0即真, 或者非空即真

  // 3. String里存在 ''' ''', 可以输入多行字符串
}
