import 'dart:convert';

import 'package:flutter_app_test/generated/json/base/json_convert_content.dart';

BaseResp baseRespFromJson(String str) => BaseResp.fromJson(json.decode(str));

String baseRespToJson(BaseResp data) => json.encode(data.toJson());

class BaseResp {
  BaseResp({
    this.code,
    this.msg,
    this.data,
  });

  int code;
  String msg;
  dynamic data;

  BaseResp.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    code = json["code"];
    msg = json["msg"];
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data,
      };
}
