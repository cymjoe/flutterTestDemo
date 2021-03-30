import 'package:flutter_app_test/ios/IosBottomSheet.dart';
import 'package:flutter_app_test/ios/IosDialog.dart';
import 'package:flutter_app_test/ios/IosFullDialog.dart';
import 'package:flutter_app_test/ios/IosLongPressDialog.dart';

import '../main.dart';

const home = "/page/home";
const ios_bottom_sheet = "/page/ios/bottom_sheet";
const ios_dialog = "/page/ios/dialog";
const ios_long_press_dialog = "/page/ios/ios_long_press_dialog";
const ios_full_dialog = "/page/ios/ios_full_dialog";

// ignore: non_constant_identifier_names
var RoutePath = {
  "$home": (context) => MyHomePage(),
  "$ios_bottom_sheet": (context) => IosBottomSheet(),
  "$ios_dialog": (context) => IosDialog(),
  "$ios_long_press_dialog": (context) => IosLongPressDialog(),
  "$ios_full_dialog": (context) => IosFullDialog(),
};
