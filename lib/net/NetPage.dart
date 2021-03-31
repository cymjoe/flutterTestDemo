import 'package:flutter/material.dart';
import 'package:flutter_app_test/net/utils/BaseNetWork.dart';
import 'package:flutter_app_test/net/utils/entity/SmsEntity.dart';
import 'package:flutter_app_test/net/utils/entity/sms_response_entity.dart';

import 'utils/entity/BaseResp.dart';

class NetPage extends StatefulWidget {
  @override
  _NetPageState createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool success = false;

  _login() {
    BaseNetWork.post<SmsResponseEntity>("sms-file/sms", {
      'phoneNumber': "+86-18581971202",
      'clientEnum': "PHONE",
      'smsTemplateEnum': "USER_LOGIN"
    }, (success) {
      print(success.message);
      setState(() {
        this.success = true;
      });
    }, (error) {
      print(error.msg);
      this.success = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: success ? Colors.green : Colors.red,
          child: TextButton(
            onPressed: () {
              _login();
            },
            child: Text('sendPhone'),
          ),
        ),
      ),
    );
  }
}
