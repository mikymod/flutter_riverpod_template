import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:os_flutter_project/exceptions/async_error_logger.dart';
import 'package:os_flutter_project/exceptions/error_logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  final errorLogger = ErrorLogger();
  registerErrorHandler(errorLogger);

  // TODO: Add cross-flavor configuration here

  runApp(
    ProviderScope(
      observers: [AsyncErrorLogger()],
      child: await builder(),
    ),
  );
}

void registerErrorHandler(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
