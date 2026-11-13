import 'dart:developer' as developer;

/// Thin logging facade. Swap the implementation (e.g. for a crash reporter)
/// without touching call sites. Pure Dart, so data/sync code that logs stays
/// testable without Flutter.
abstract final class AppLogger {
  static const _isRelease = bool.fromEnvironment('dart.vm.product');

  static void info(String message, {String name = 'parichit'}) {
    if (!_isRelease) developer.log(message, name: name);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace, String name = 'parichit'}) {
    developer.log(message, name: name, error: error, stackTrace: stackTrace, level: 1000);
  }
}
