import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  final imageurl =
      'https://hbimg.huabanimg.com/c145d5a21054dc404773cec5b3fda25ea29db29c5ef26-ekIbcS_fw658/format/webp';

  @override
  Widget build(BuildContext context) {
    return IconExtensionDemo();
  }
}

class IconExtensionDemo extends StatelessWidget {
  const IconExtensionDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.pets, size: 300, color: Colors.orange,);
  }
}

class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key? key,
    required this.imageurl,
  }) : super(key: key);

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        // 占位图
        placeholder: AssetImage('assets/images/mao.jpeg'),
        image: NetworkImage(imageurl));
  }
}
