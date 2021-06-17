main(List<String> args) {
  test((num1, num2) {
    print(num1 + num2);
    return num1 + num2;
  });

  var demo1 = demo();
  print(demo1(20, 30));
}

// 函数别名
typedef Calculate = int Function(int num1, int num2);

// void test(int foo(int num1, int num2)) {
//   foo(20, 30);
// }

void test(Calculate calc) {
  calc(20, 30);
}

Calculate demo() {
  return (num1, num2) {
    return num1 * num2;
  };
}
