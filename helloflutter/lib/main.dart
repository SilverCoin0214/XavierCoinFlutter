/*
 * @Author: your name
 * @Date: 2021-07-06 22:47:40
 * @LastEditTime: 2022-03-17 10:59:29
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/helloflutter/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'StringParser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  late InlineSpan span;

  final String content =
      """一点不错，”狐狸说。“对我来说，你还只是一个小男孩，就像其他千万个小男孩一样。我不需要你。你也同样用不着我。对你来说，我也不过是一只狐狸，和其他千万只狐狸一样。但是，如果你驯服了我，我们就互相不可缺少了。对我来说，你就是世界上唯一的了；我对你来说，也是世界上唯一的了。""";

  late StringParser parser;
  int endIndex = 0;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    parser = StringParser(content: content, endIndex: endIndex);
    span = parser.parser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("滚动高亮文本"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  this.flag = true;
                  _starPlay(flag);
                  print('开始');
                },
                child: Text("开始")),
            ElevatedButton(
                onPressed: () {
                  this.flag = false;
                  // _starPlay(flag);
                  print('暂停');
                },
                child: Text("暂停"))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text.rich(span),
        ));
  }

  _starPlay(flag) {
    if (this.endIndex == content.length + 1 || !flag) {
      return;
    }

    parser = StringParser(content: content, endIndex: this.endIndex++);
    span = parser.parser();

    setState(() {});
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      _starPlay(this.flag);
    });
  }
}
