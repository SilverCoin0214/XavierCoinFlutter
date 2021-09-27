/*
 * @Author: your name
 * @Date: 2021-07-06 22:47:40
 * @LastEditTime: 2021-09-27 19:45:52
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/helloflutter/lib/main.dart
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        width: 400,
        height: 200,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            print('查看当前的$index');
            return Container(
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _content(index),
              ),
            );
          },
          itemCount: 3,
          // viewportFraction: 0.8,
          // scale: 0.9,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            activeColor: Colors.red,
          )),
          itemWidth: 50.0,
          itemHeight: 50,
        ),
      ),
    );
  }

  _content(index) {
    List res = [];

    res.add([
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    ]);

    res.add([
      Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.pink,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    ]);

    res.add([
      Container(
        width: 100,
        height: 100,
        color: Colors.purple,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.grey,
      ),
    ]);

    return res[index];

  }
}
