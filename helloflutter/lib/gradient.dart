/*
 * @Author: your name
 * @Date: 2021-07-06 22:47:40
 * @LastEditTime: 2022-03-15 11:52:21
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/helloflutter/lib/main.dart
 */
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var _starX = 0.0;
  @override
  Widget build(BuildContext context) {
    Gradient gradient = LinearGradient(colors: [
      Colors.red,
      Colors.green,
    ]);
// 根据渐变创建shader
// 范围是从左上角(0,0),到右下角(size.width,size.height)全屏幕范围
    Shader shader = gradient.createShader(
      Rect.fromLTWH(_starX, 0, 5, 30),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("歌词demo"),
        actions: [
          ElevatedButton(
              onPressed: () {
                _starPlay();
              },
              child: Text("开始"))
        ],
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "是领导风格一接吻日归类为拉开距离个", style: TextStyle(
                // foreground: Paint()..shader = shader,
              )),
              TextSpan(text: "创建线性渐变,蓝色强调色到绿色就上帝来法规及我两个六个娃儿录入",
                style: TextStyle(
                foreground: Paint()..shader = shader,
              )),
              TextSpan(text: "创建线性渐变,蓝色强调色到绿色就上帝来法规及我两个六个娃儿录入"),
            ]
          ),
          style: TextStyle(
            fontSize: 36.0,
            // color: Colors.red,
            // 创建一个新的Paint并指定shader
            // 注意这里能复用的话还是不要动态创建了
            foreground: Paint()..shader = shader,
          ),
        ),
      ),
    );
  }
  _starPlay() {
    _starX = _starX + 5;
    if (_starX >= MediaQuery.of(context).size.width) {
      _starX = 0;
    }
    setState(() {});
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      _starPlay();
    });
  }
}
