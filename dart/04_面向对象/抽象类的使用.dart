main(List<String> args) {
  // var s = Shape();

  final map = Map();
  print(map.runtimeType);

  var re = Rectangle(20, 40);
  var cir = Circle(3);

  print(re.getArea());
  print(cir.getArea());
}

// 注意点: 抽象类不能实例化
// 抽象方法必须存在于抽象类中.
// 抽象类需要使用abstract声明
abstract class Shape {
  getArea();

  String getInfo() {
    return '形状';
  }

  // factory Shape() {
  //   return Rectangle();
  // }
}

// 注意点: 继承自抽象类后, 必须实现抽象类的抽象方法, 抽象类中已经实现的方法, 可以不被子类重写.
class Rectangle extends Shape {
  double w;
  double h;

  Rectangle(this.w, this.h);

  @override
  double getArea() {
    return w * h;
  }

}

class Circle extends Shape {
  double r;

  Circle(this.r);

  @override
  double getArea() {
    return r * r * 3.14;
  }
}
