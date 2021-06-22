main(List<String> args) {
  // 1. List 使用[]
  var name = ['abc', 'cde', 'fff'];
  print('$name - 当前类型 ${name.runtimeType}');
  List<int> numbers = [1, 2, 3, 4, 5];
  print('$numbers - 当前类型 ${numbers.runtimeType}');

  // 2. Set 使用{}
  var movie = {'星际穿越', '盗梦空间', '银河系漫游指南'};
  Set<int> numberSet = {1, 2, 3, 4, 5, 5, 4};
  print('$numberSet - 当前类型 ${numberSet.runtimeType}');

  // tips: List 和 Set 的最大区别自在于, Set是无序的, 并且元素是不重复的.

  // 3 Map 键值对
  var info = {
    "name": "hanmeimei",
    "age": 20,
  };

  Map<String, Object> infoMap = {'height': 1.88, 'name': 'good job!'};
  print('$infoMap - 当前类型${infoMap.runtimeType}');

  print(name);
  print(movie);
  print(info);

  // 集合常见操作

  // 获取长度
  print('获取numbers长度: ${numbers.length}');
  print('获取numberSet长度: ${numberSet.length}');
  print('获取infoMap长度: ${infoMap.length}');

  // List有序, 所以可以添加/删除/包含
  numbers.add(188);
  numberSet.add(188);
  print('查看add后的numbers: ${numbers}');
  print('查看add后的numberSet: ${numberSet}');

  numbers.remove(3);
  numberSet.remove(3);
  print('查看remove后的numbers: ${numbers}');
  print('查看remove后的numberSet: ${numberSet}');

  print(numbers.contains(2));
  print(numberSet.contains(2));

  numbers.removeAt(0);
  print('查看remove后的numbers: ${numbers}');

  // Map操作
  // 1. 根据Key获取value
  print('根据key获取value: ${infoMap['name']}');

  // 2. 获取所有的entries
  print('获取所有的entries: ${infoMap.entries} - ${infoMap.entries.runtimeType}');

  // 3. 获取所有的keys
  print('获取所有的keys: ${infoMap.keys} - ${infoMap.keys.runtimeType}');

  // 4. 获取所有的values
  print('获取所有的values: ${infoMap.values} - ${infoMap.values.runtimeType}');

  // 5. 获取某个key 或者 value 是否存在
  print('获取某个Key: ${infoMap.containsKey('name')}');
  print('获取某个Value: ${infoMap.containsValue(1.5)}');

  // 6. 删除Key元素
  infoMap.remove('height');
  print('删除key元素: ${infoMap}');
}
