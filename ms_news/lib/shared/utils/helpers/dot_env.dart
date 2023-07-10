import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:ms_news/shared/shared.dart';

class DotEnvUtils {
  static Future<void> loadEnv(String envPath) async {
    await dotenv.load(fileName: envPath);
  }

  static String getEnvValue(String key) => dotenv.env[key] ?? "";

  static String get prodBaseUrl => getEnvValue(DotEnvKeys.prodBaseUrlEnvKey);
}
