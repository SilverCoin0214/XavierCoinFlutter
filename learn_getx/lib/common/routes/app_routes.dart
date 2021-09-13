// ignore_for_file: constant_identifier_names

/*
 * @Author: sce
 * @Date: 2021-09-13 21:44:00
 * @LastEditTime: 2021-09-14 00:59:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/common/routes/app_routes.dart
 */

part of 'app_pages.dart';

abstract class AppRoutes {
  static const Home = '/home';
  static const List = '/list';
  static const Detail = '/detail';
  static const Detail_ID = '/detail/:id';

  static const NotFound = '/notfound';
  static const Login = '/login';
  static const My = '/my';
}
