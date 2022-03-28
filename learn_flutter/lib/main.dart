/*
 * @Author: your name
 * @Date: 2021-09-09 15:44:07
 * @LastEditTime: 2021-11-16 15:18:35
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /learn_flutter/lib/main.dart
 */
import 'package:flutter/material.dart';

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
        title: Text('基础widget - 下拉列表'),
      ),
      body: SceHomeContent(),
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
    return ContainerDemo();
  }
}
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: ListView(
        children: [
          ExpansionTile(
            textColor: Colors.black,
            title: Row(
              children: [
                Text('注册制创业板适当性评估结果'),
                Spacer(),
                Text('匹配', style: TextStyle(color: Colors.blue),)
              ],
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12),
                    ),
                ),
              ),

              Container(
                child: Row(
                      children: [
                        Icon(Icons.add),
                        Expanded(
                          child: ListTile(
                            title: Text('您的风险等级: C4积极型'),
                            subtitle: Text('创业板的风险等级: 中等偏高风险'),
                          ),
                        )
                      ],
                    ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12),
                    ),
                    color: Color.fromRGBO(248, 248, 248, 1),
                ),
              ),

              Container(
                child: Row(
                      children: [
                        Icon(Icons.add),
                        Expanded(
                          child: ListTile(
                            title: Text('您的投资期限: 无特别要求'),
                            subtitle: Text('创业板的投资期限: 无特别要求'),
                          ),
                        )
                      ],
                    ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12),
                    ),
                    color: Color.fromRGBO(248, 248, 248, 1),
                ),
              ),

              Container(
                child: Row(
                      children: [
                        Icon(Icons.add),
                        Expanded(
                          child: ListTile(
                            title: Text('您的投资品种: 期货, 期权'),
                            subtitle: Text('创业板的投资期限: 无特别要求'),
                          ),
                        )
                      ],
                    ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12),
                    ),
                    color: Color.fromRGBO(248, 248, 248, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

