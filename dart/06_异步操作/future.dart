import 'dart:io';

main(List<String> args) {
  print('main start');

  // 发送网络请求
  var future = getNetworkData();
  print(future);

  future.then((String value) {
    print(value);
  }).catchError((err) {
    print(err);
  }).whenComplete(() => {
    print('代码执行完成')
  });

  print('main end');
}

// 模拟网络请求
Future<String> getNetworkData() {
  return Future<String>(() {
    sleep(Duration(seconds: 2));
    // return 'Hello world';

    throw Exception('弹出错误信息');
  });
}
