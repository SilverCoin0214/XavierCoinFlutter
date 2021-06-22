main(List<String> args) {
  // 创建list
  var names1 = ['sce', 'zaj', 'xavier', 111];
  print(names1.runtimeType);

  // 添加了类型限制后会报错
  // var names2 = <String>['sce', 'zaj', 'xavier', 111];
  // print(names2.runtimeType);

  // 创建map
  var infos1 = {1: 'one', 'name': 'why', 'age': 18};
  print(infos1.runtimeType);

  // 添加了类型限制后会报错
  // Map info2 = <String, String>{'name': 'sce', 'age': 18};
  // print(info2.runtimeType);

  Map<String, String> infos2 = {'name': 'why', 'age': '123'};
  print(infos2.runtimeType);
}
