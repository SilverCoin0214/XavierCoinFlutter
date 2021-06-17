main(List<String> args) {
  // ??= 当原来的变量有值时, ??= 不执行
  var name;
  name ??= "zaj";
  print(name);

  // ??
  // ??前面有值, 那么就使用 ?? 前面的数据
  var my;
  var temp = my ?? 'zaj';
  print(temp);
}
