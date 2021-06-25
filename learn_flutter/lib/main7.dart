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
        title: Text('基础widget - Button'),
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
    return ImageDemo2();
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => print('ElevatedButton Click'),
            child: Text('ElevatedButton')),
        TextButton(
            onPressed: () => print('TextButton Click'),
            child: Text('TextButton')),
        OutlinedButton(
            onPressed: () => print('OutlinedButton Click'),
            child: Text('OutlinedButton')),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
            ),
            onPressed: () => {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.favorite, color: Colors.red), Text('喜欢')],
            )),
      ],
    );
  }
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

  final imageurl =
      'https://hbimg.huabanimg.com/c145d5a21054dc404773cec5b3fda25ea29db29c5ef26-ekIbcS_fw658/format/webp';

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageurl),
      fit: BoxFit.fitWidth,
    );
  }
}

class ImageDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assest/images/fox.jpg"),
    );
    // return Image.asset("assest/images/mao.jpeg");
  }
}
