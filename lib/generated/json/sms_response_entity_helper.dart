import 'package:flutter_app_test/net/utils/entity/sms_response_entity.dart';

smsResponseEntityFromJson(SmsResponseEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['requestId'] != null) {
		data.requestId = json['requestId'].toString();
	}
	if (json['bizId'] != null) {
		data.bizId = json['bizId'].toString();
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	return data;
}

Map<String, dynamic> smsResponseEntityToJson(SmsResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['requestId'] = entity.requestId;
	data['bizId'] = entity.bizId;
	data['message'] = entity.message;
	return data;
}