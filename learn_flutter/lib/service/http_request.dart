import 'package:dio/dio.dart';
import 'package:learn_flutter/service/config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String methods = 'get', Map<String, dynamic>? params}) async {
    // 1. 创建单独配置
    final options = Options(method: methods);

    // 2. 发送网络请求
    try {
      Response respones =
        await dio.request(url, queryParameters: params, options: options);

      return respones.data;
    }on DioError catch (e) {
      return Future.error(e);
    }
  }
}
