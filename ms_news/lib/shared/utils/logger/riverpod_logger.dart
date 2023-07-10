import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  static const String tag = "RiverpodLogger";

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    log(
      "provider: ${provider.name ?? provider.runtimeType}",
    );

    if (newValue is int ||
        newValue is bool ||
        newValue is String ||
        newValue is num ||
        newValue is double) {
      log("prevValue: $previousValue");
      log("newValue: $newValue");
    }
  }
}
