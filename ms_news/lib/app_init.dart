import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'package:ms_news/shared/shared.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // load environment variables
    await DotEnvUtils.loadEnv(AssetPath.env);

    /// https://github.com/flutter/flutter/issues/35162
    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }
  }
}
