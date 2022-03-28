/*
 * @Author: your name
 * @Date: 2022-03-03 15:41:14
 * @LastEditTime: 2022-03-03 15:41:14
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/route/router_name.dart
 */

import 'package:flu_nav/pages/home.dart';
import 'package:flu_nav/pages/list.dart';

final routerNames = {
  "/": (context) => const HomePage(),
  "/list": (context) => ListPage(),
};
