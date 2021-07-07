main(List<String> args) {

  // 相当于promise.resolve
  Future.value('.valueAPI').then((value) {
    print(value);
  });

  // 相当于 promise.reject
  Future.error('返回错误信息').catchError((err) {
    print(err);
  });

  Future.delayed(Duration(seconds: 2)).then((value) => print('hello world'));
}
