import 'package:dio/dio.dart';
import 'package:flutter_app_test/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_test/net/constant/Constants.dart';
import 'package:flutter_app_test/net/utils/AuthInterceptor.dart';
import 'package:flutter_app_test/net/utils/ErrorInterceptor.dart';

import 'entity/BaseResp.dart';

class BaseNetWork {
  // 工厂模式
  factory BaseNetWork() => _getInstance();

  static BaseNetWork get instance => _getInstance();
  static BaseNetWork _instance;
  Dio dio;
  BaseOptions options;

  BaseNetWork._internal() {
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: Constants.BASE_URL,
          connectTimeout: 10000,
          receiveTimeout: 1000 * 60 * 60 * 24,
          responseType: ResponseType.json,
          headers: {"Content-Type": "application/json"})
      //网络状态拦截
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(HttpLog())
      ..interceptors.add(ErrorInterceptor());
  }

  static BaseNetWork _getInstance() {
    if (_instance == null) {
      _instance = new BaseNetWork._internal();
    }
    return _instance;
  }

//user/verifyVerificationCode
  static post<T>(String url, data, Function(T map) onSuccess,
      Function(BaseResp error) onError) async {
    var response = await BaseNetWork.instance.dio
        .post(Constants.BASE_URL + url, data: data);
    String body = response.toString();
    BaseResp resp = baseRespFromJson(body);
    if (resp.code == Constants.OK) {
      Map data = new Map<String, dynamic>.from(resp.data);
      onSuccess(JsonConvert.fromJsonAsT<T>(data));
    } else {
      onError(resp);
    }
  }

  static get<T>(String url, Function(T map) onSuccess,
      Function(BaseResp error) onError) async {
    var response = await BaseNetWork.instance.dio.get(Constants.BASE_URL + url);
    String body = response.toString();
    BaseResp resp = baseRespFromJson(body);
    if (resp.code == Constants.OK) {
      Map data = new Map<String, dynamic>.from(resp.data);
      onSuccess(JsonConvert.fromJsonAsT<T>(data));
    } else {
      onError(resp);
    }
  }
}
