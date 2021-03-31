import 'package:flutter_app_test/generated/json/base/json_convert_content.dart';

class SmsResponseEntity with JsonConvert<SmsResponseEntity> {
	String code;
	String requestId;
	String bizId;
	String message;
}
