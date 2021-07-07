import 'package:flutter/material.dart';
import 'package:get/get.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: SceHomePage());
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class SceHomePage extends StatelessWidget {
  const SceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用Get.put()实例化类, 使其对当下所有的子路由使用
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用Obx(()=>{}) 来更新状态
      appBar: AppBar(
        title: Obx(() => Text('学习Getx - Clicks: ${c.count}')),
      ),
      // 使用Get.to()来跳转下一个页面
      body: Center(
        child: ElevatedButton(
          child: Text('Go to other'),
          onPressed: () => Get.to(Other()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
  }
}

class Other extends StatelessWidget {
  // 可以让Get找到一个正在被其他页面使用的Controller, 并将它返回
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    // 访问更新后的计数变量
    return Scaffold(
      body: Center(
        child: Text('${c.count}'),
      ),
    );
  }
}
