// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> platformDetails(String target) async {
  // Add your function code here!
  String? x;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  print(target);
  print(defaultTargetPlatform);
  if (target == "false") {
    if (defaultTargetPlatform == TargetPlatform.android) {
      //deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      var build = await deviceInfoPlugin.androidInfo;

      x = build.id!;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      //deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      var build = await deviceInfoPlugin.windowsInfo;

      x = build.deviceId!;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      //deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      var iosInfo = await deviceInfoPlugin.iosInfo;
      print(iosInfo);
      print(iosInfo.identifierForVendor);
      x = iosInfo.identifierForVendor;
    }
  } else {
    var build = await deviceInfoPlugin.webBrowserInfo;

    x = build.productSub!;
  }

  return x!;
}
