import 'package:dio/dio.dart';
import 'package:my_flutter/core/services/config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.baseURL,
      connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
        Map<String, dynamic> params,
        Interceptor inter}) async {
    final Options options = Options(method: method);
    Interceptor interceptor = InterceptorsWrapper(
      onRequest: (options) {
        print(options);
        return options;
      },
      onError: (error) {
        print(error);
        return error;
      },
      onResponse: (response) {
        print(response);
        return response;
      }
    );

    List<Interceptor> inters = [interceptor];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}