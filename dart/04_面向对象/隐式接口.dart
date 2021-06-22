main(List<String> args) {
  var sm = SuperMan();

  sm.running();
  sm.flying();
}

// dart中没有关键字来定义接口
// 默认情况下所有类都是隐式接口
// dart只支持单继承

// 在开发中通常将用于给别人实现的类声明为抽象类
abstract class Runner {
  void running() {}
}

abstract class Flyer {
  void flying() {}
}

// 在通过 implement实现某个类时, 类中所有的方法都必须被重新实现(无论这个类原来是否已经实现过该方法)
class SuperMan implements Runner, Flyer {
  @override
  void running() {
    print('superMan is running');
  }

  @override
  void flying() {
    print('superMan is flying');
  }
}
