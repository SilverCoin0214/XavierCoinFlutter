import 'dart:io';

main(List<String> args) {
  print('main start');

  Future(() {
    sleep(Duration(seconds: 2));
    return '第1次结果';

    // throw Exception('第一次异常');
  }).then((res) {
    print(res);

    sleep(Duration(seconds: 1));
    // return '第2次结果';

    throw Exception('第二次异常');
  }).then((res) {
    print(res);

    sleep(Duration(seconds: 1));
    return '第3次结果';
  }).then((res) {
    print(res);
  }).catchError((err) {
    print(err);
  });

  print('main end');
}
