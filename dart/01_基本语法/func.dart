main(List<String> args) {
  // 正常函数调用
  test(bar);

  // 匿名函数
  test(() {
    print('匿名函数被调用');
    return 10;
  });

  // 箭头函数: 只能有一行
  test(() => print("箭头函数被调用"));


}

// 函数可以作为另外一个函数的参数
void test(Function foo) {
  foo();
}

void bar() {
  print("bar函数被调用");
}
