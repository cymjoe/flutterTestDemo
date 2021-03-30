import 'package:flutter/material.dart';
import 'package:flutter_app_test/base/CustomerRoute.dart';

class RouteUtils {
  static launch(BuildContext context, Widget routeName) {
    return Navigator.push(context, CustomerRoute(routeName));

    // return Navigator.pushNamed(context, routeName, arguments: params);
  }

  static back(BuildContext context, {Object params}) {
    return Navigator.pop(context, params);
  }
}
