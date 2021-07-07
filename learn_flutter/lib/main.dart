import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/service/http_request.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SceHomePage());
  }
}

class SceHomePage extends StatelessWidget {
  const SceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求'),
      ),
      body: SceHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () => {},
      ),
    );
  }
}

class SceHomeContent extends StatefulWidget {
  const SceHomeContent({Key? key}) : super(key: key);

  @override
  _SceHomeContentState createState() => _SceHomeContentState();
}

class _SceHomeContentState extends State<SceHomeContent> {
  @override
  Widget build(BuildContext context) {
    return LinstenerDemo();
  }
}

class LinstenerDemo extends StatefulWidget {
  const LinstenerDemo({
    Key? key,
  }) : super(key: key);

  @override
  _LinstenerDemoState createState() => _LinstenerDemoState();
}

class _LinstenerDemoState extends State<LinstenerDemo> {
  ScrollController controller = ScrollController(initialScrollOffset: 300);

  @override
  void initState() {
    super.initState();

    // 发送网络请求
    // 1. 创建dio对象
    // final dio = Dio();

    // 2. 发送网络请求
    // dio.get("https://httpbin.org/get").then((res) {
    //   print('测试网络发送内容get方式----$res');
    // });

    // dio.post("https://httpbin.org/post").then((res) {
    //   print('测试网络发送内容post方式---$res');
    // });


    // 封装好的网络请求
    HttpRequest.request('https://httpbin.org/get', params: {'name': 'sce'})
        .then((res) {
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        // print('监听到滚动');

        if (notification is ScrollStartNotification) {
          print('开始滚动');
        } else if (notification is ScrollUpdateNotification) {
          print('正在滚动');
        } else if (notification is ScrollEndNotification) {
          print('结束滚动');
        }
        return true;
      },
      child: ListView.builder(
        /**
         * 两种监听方式:
         *  controller
         *    - 可以设置默认值offset
         *    - 监听滚动, 也可以监听滚动的位置
         *  NotificationListener
         *    - 开始滚动和结束滚动
         */
        controller: controller,
        itemCount: 100,
        itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.delete),
            title: Text('联系人${index + 1}'),
            subtitle: Text('联系人电话号码: 1238945y'),
          );
        },
      ),
    );
  }
}
