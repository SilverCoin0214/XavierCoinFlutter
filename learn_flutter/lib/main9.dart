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
        title: Text('基础widget - 表单'),
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
  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.yellow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: usernameTextEditController,
              decoration: InputDecoration(
                labelText: 'username',
                icon: Icon(Icons.people),
                hintText: "请输入用户名",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.red[100],
              ),
              // 监听键盘点击
              onChanged: (value) {
                print(value);
              },
              // 监听提交
              onSubmitted: (value) {
                print('onSubmitted: $value');
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordTextEditController,
              decoration: InputDecoration(
                labelText: 'password',
                icon: Icon(Icons.lock),
                hintText: "请输入用户名",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.blue[100],
              ),
              // 监听键盘点击
              onChanged: (value) {
                print(value);
              },
              // 监听提交
              onSubmitted: (value) {
                print('onSubmitted: $value');
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 30,
              child: TextButton(
                onPressed: () {
                  final username = usernameTextEditController.text;
                  final password = passwordTextEditController.text;
                  print('username: $username, password: $password');
                  usernameTextEditController.text = '';
                  passwordTextEditController.text = '';
                },
                child: Text('登 录'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
