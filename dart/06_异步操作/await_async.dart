import 'dart:ffi';
import 'dart:io';

main(List<String> args) {
  print('main start');

  getData();

  print('main end');
}

void getData() async {
  // getNetworkData('args1').then((value) {
  //   print(value);
  //   return getNetworkData(value);
  // }).then((value) {
  //   print(value);
  //   return getNetworkData(value);
  // }).then((value) {
  //   print(value);
  // });

  var res1 = await getNetworkData('args1');
  print(res1);
  var res2 = await getNetworkData(res1);
  print(res2);
  var res3 = await getNetworkData(res2);
  print(res3);
}

// 模拟网络请求
Future getNetworkData(String args) {
  return Future(() {
    sleep(Duration(seconds: 2));
    return 'hellor World' + args;
  });
}
