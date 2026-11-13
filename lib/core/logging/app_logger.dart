import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Thin logging facade. Swap the implementation (e.g. for a crash reporter)
/// without touching call sites.
abstract final class AppLogger {
  static void info(String message, {String name = 'parichit'}) {
    if (kDebugMode) developer.log(message, name: name);
  }

  static void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String name = 'parichit',
  }) {
    developer.log(message, name: name, error: error, stackTrace: stackTrace, level: 1000);
  }
}
