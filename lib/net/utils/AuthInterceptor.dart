import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers['content-type'] = 'application/json;charset=utf-8';
    options.headers['Authorization'] = 'JWT ';
    super.onRequest(options, handler);
  }
}

class HttpLog extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("\n ---------Start Http Request---------");
    print("Request_BaseUrl:${options.baseUrl}");
    print("Request_Path:${options.path}");
    print("Request_Method:${options.method}");
    print("Request_Headers:${options.headers}");
    print("Request_Data:${options.data}");
    print("Request_QueryParameters:${options.queryParameters}");
    print("---------End Http Request---------");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
    print("---------Start Http Response---------");
    print("Response_BaseUrl:${response.realUri.toString()}");
    // print("Response_Path:${response.data.path}");
    print("Response_StatusCode:${response.statusCode}");
    print("Response_StatusMessage:${response.statusMessage}");
    print("Response_Headers:${response.headers.toString()}");
    print("Response_Body:\n${response.toString()}");
    print("---------End Http Response---------");
  }
}
