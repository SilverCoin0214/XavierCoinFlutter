main(List<String> args) {
  var p = SuperMan();

  p.running();
  p.flying();
  p.eating();
}


// 除了通过class定义类之外, 也可以通过mixin关键字来定义一个类
// 只是通过mixin定义的类用于被其他类混入使用, 通过with关键字来进行混入
mixin Runner {
  void running() {
    print('Runner running');
  }
}

mixin Flyer {
  void flying() {
    print('Flyting');
  }
}

class Animal {
  void eatting() {
    print('eatting');
  }
}

class SuperMan extends Animal with Runner, Flyer {
  // @override
  void eating() {
    super.eatting();
    print('over');
  }
}
