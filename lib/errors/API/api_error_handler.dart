import 'dart:async';
import 'dart:io';

import 'package:api_pattern/Errors/API/api_error_exceptions.dart';
import 'package:api_pattern/Services/Snackbar/snackbar_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIErrorHandler {
  final _snackbarService = SnackbarService();

  void getErrorHandler({
    required Object error,
    bool showSnackBar = false,
    ScaffoldMessengerState? scaffoldMessengerState,
    VoidCallback? onTimeoutCallback,
    VoidCallback? onAPIErrorCallback,
    VoidCallback? onDisconnectCallback,
  }) {
    try {
      if (error is APIException) {
        if (showSnackBar) {
          _errorHandlingWithSnackbar(
            scaffoldMessengerState: scaffoldMessengerState,
            error: error,
          );
        }
        onAPIErrorCallback?.call();
      } else if (error is TimeoutException) {
        onTimeoutCallback?.call();
      } else if (error is SocketException) {
        onDisconnectCallback?.call();
      }
      debugSLog(error);
    } catch (e) {
      debugSLog('in getErrorHandler function: $e');
    }
  }

  dynamic getAPIExceptionHandler(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
        throw InternalServerError(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  void _errorHandlingWithSnackbar({
    ScaffoldMessengerState? scaffoldMessengerState,
    required Object error,
  }) {
    if (kIsWeb == false) {
      if (scaffoldMessengerState == null) {
        throw Exception('No scaffold messenger state found!');
      }
      _snackbarService.showErrorSnackBar(
        scaffoldMessengerState: scaffoldMessengerState,
        message: error.toString(),
      );
    }
  }

  void debugSLog(dynamic e) {
    debugPrint(e.toString());
  }
}
