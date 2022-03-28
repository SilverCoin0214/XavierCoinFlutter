/*
 * @Author: your name
 * @Date: 2022-03-03 11:21:53
 * @LastEditTime: 2022-03-03 11:26:13
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/ex_03_generate.dart
 */

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const NavitatorApp());
}

class NavitatorApp extends StatelessWidget {
  const NavitatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: (settings) {
      if (settings.name == '/') {
        return MaterialPageRoute(builder: (context) => const ListPage());
      }

      var uri = Uri.parse(settings.name!);
      if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'details') {
        var id = uri.pathSegments[1];
        return MaterialPageRoute(builder: (context) => DetailPage(id: id));
      }

      return MaterialPageRoute(builder: (context) => const UnknownPage());
    });
  }
}


class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: const Text('Navigator.pushNamed -> Details'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details/001',
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: Text('Navigator.pop -> Pop, id = ' + id),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}


class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: const Text('Navigator.pop -> Unknown'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
