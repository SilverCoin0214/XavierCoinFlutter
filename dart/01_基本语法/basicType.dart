main(List<String> args) {
  // var 类型使用
  var name = 'sce';
  name = 'lalaland';

  print("name的类型是: ${name.runtimeType}");

  // dynamic, 相当于any, 编译时不会报错, 但是运行时可能会出错.
  dynamic myName = 'zaj';
  print('myName现在的类型是: ${myName.runtimeType}');
  myName = 18;
  print('myName修改后的类型是: ${myName.runtimeType}');

  // final 和 const 都是定义常量,
  // 区别:
  // 1. final是在赋值时, 可以动态获取, 也就是运行时可以获取一个值, 获取到了后就无法在修改
  // 2. const赋值时, 必须在编译前就确定下来.  二者的最大区别就在于一个编译前确定, 一个可以运行时确定.

  final finName = getName();
  print('final定义的值是可以获取到的: ${finName}');
  print('无法使用const来定义这种赋值');

}

String getName() {
  return 'good job!';
}
