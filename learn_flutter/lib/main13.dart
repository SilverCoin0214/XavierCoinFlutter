import 'dart:math';

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
        title: Text('基础widget - GridView'),
      ),
      body: SceHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('FloatingActionButton Click'),
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (BuildContext ctx, int index) {
         return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
      },
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5, // 宽度/高度
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        }),
      ),
    );
  }
}
