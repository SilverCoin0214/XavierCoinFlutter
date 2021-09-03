/*
 * @Author: your name
 * @Date: 2021-09-01 20:48:23
 * @LastEditTime: 2021-09-01 21:15:00
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/dart/document/01.dart
 */
// 1. 每个应用都只有一个main函数
void main(List<String> args) {
  print('hello, world');

  // 2. 变量
  var name = 'sce';
  var year = 1803;
  var antennaDiameter = 3.7;
  var flybyObject = ['jupiter', 'saturn'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  // 3. 流程控制
  if (year <= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (var object in flybyObject) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  // 函数
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);

  print(result);

  // 使用类
  var voyager = Spacecraft('voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

// 类

class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

// 继承类
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

// // 接口和抽象类
// // Dart 没有interface 关键字, 所以所有的类都隐式定义了一个接口. 因此, 任何类都可以作为接口被实现.
// class MockSpaceship implements Spacecraft {

// }

// 异步 async await

const oneSecond = Duration(seconds: 1);
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}


