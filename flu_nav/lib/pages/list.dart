/*
 * @Author: your name
 * @Date: 2022-03-03 14:36:38
 * @LastEditTime: 2022-03-03 14:46:27
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/pages/home.dart
 */

import 'package:flu_nav/api/news.dart';
import 'package:flu_nav/entity/news.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<NewsEntity>? newsList;

  @override
  void initState() {
    super.initState();
    newsList = getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: Material(
        child: newsList == null
          ? Container()
          : ListView(
            children: [
              for (var item in newsList!)
                ListTile(
                  title: Text('${item.title}'),
                  subtitle: Text('${item.description}'),
                  onTap: () => {},
                )
            ],
          )
        ,
      ),

    );
  }
}
