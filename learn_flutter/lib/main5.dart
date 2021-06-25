import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: SceHomePage(),
    );
  }
}

class SceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('生命周期')),
      body: SceHomePageBody(),
    );
  }
}

// statelessWidget生命周期 - 1. 先调用constructor, 2. 再调用build
// class SceHomePageBody extends StatelessWidget {
//   final message;

//   SceHomePageBody(this.message) {
//     print('调用SceHomePageBody构造函数');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('调用build方法');
//     return Text(message);
//   }
// }


/**
 * StatefulWidget生命周期
 * 1. 先调用 Stateful Widget里的 constructor 方法
 * 2. 在调用 Stateful Widget里的 createState 方法
 * 3. 之后调用 State Object 里的 constructore 方法
 * 4. 接着 State Object 里的 initState
 * 5. 之后才是 State Object 里的 build
 * 6. 最后进行销毁, State Object里的 dispose
 *
 *
 * 首先，执行StatefulWidget中相关的方法：
 *    1、执行StatefulWidget的构造函数（Constructor）来创建出StatefulWidget；
 *    2、执行StatefulWidget的createState方法，来创建一个维护StatefulWidget的State对象；
 * 其次，调用createState创建State对象时，执行State类的相关方法：
 *    1、执行State类的构造方法（Constructor）来创建State对象；
 *
 *    2、执行initState，通常会在这个方法中执行一些数据初始化的操作，或者也可能会发送网络请求；
 *
 *    3、执行didChangeDependencies方法，这个方法在两种情况下会调用
 *    3.1情况一：调用initState会调用；
 *    3.2情况二：从其他对象中依赖一些数据发生改变时
 *
 *    4. Flutter执行build方法
 *
 *    5. 当前的Widget不再使用时，会调用dispose进行销毁；
 *
 *    6.手动调用setState方法，会根据最新的状态（数据）来重新调用build方法，构建对应的Widgets；
 *
 *    7、执行didUpdateWidget方法是在当父Widget触发重建（rebuild）时，系统会调用didUpdateWidget方法
 */
class SceHomePageBody extends StatefulWidget {
  SceHomePageBody() {
    print('1.调用SceHomePageBody的constructor方法');
  }

  @override
  _SceHomePageBodyState createState() {
    print('2.调用SceHomePageBody的createState方法');
    return _SceHomePageBodyState();
  }
}

class _SceHomePageBodyState extends State<SceHomePageBody> {
  int _counter = 0;

  _SceHomePageBodyState() {
    print('3.调用 _SceHomePageBodyState的 contructor方法');
  }

  @override
  void initState() {
    super.initState();
    print('4.调用 _SceHomePageBodyState 的 initState方法');
  }

  @override
  Widget build(BuildContext context) {
    print('5.调用 _SceHomePageBodyState 的 build方法');
    return Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    child: Text('+')
                ),
                Text('当前计数: $_counter'),
              ],
    )));
  }

  @override
  void dispose() {
    print('6.调用 _SceHomePageBodyState 的 dispose方法');
    super.dispose();
  }
}
