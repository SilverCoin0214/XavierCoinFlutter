main(List<String> args) {
  Location l2 = Location<int>(10, 20);
  print(l2.x.runtimeType);

  // // 无法再使用string来定义类型
  // Location l3 = Location<String>('abc', 'cba');
  // print(l3.x.runtimeType);
}


// 添加个extends就可以限制泛型的类型
class Location<T extends num> {
  T x;
  T y;

  Location(this.x, this.y);
}
