import 'package:flutter/material.dart';

class RouteUtils {
  static launch(BuildContext context, String routeName, {Object params}) {
    return Navigator.pushNamed(context, routeName, arguments: params);
  }

  static back(BuildContext context, {Object params}) {
    return Navigator.pop(context, params);
  }
}
