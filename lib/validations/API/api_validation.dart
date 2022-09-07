import 'dart:convert';

import 'package:api_pattern/Errors/API/api_error_exceptions.dart';
import 'package:api_pattern/Errors/API/api_error_handler.dart';
import 'package:http/http.dart' as http;

class APIValidation {
  Map<String, dynamic> validation({
    required http.Response? response,
  }) {
    if (response == null) {
      throw NullResponse('');
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      APIErrorHandler().getAPIExceptionHandler(response);
    }
    final rawData =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>?;
    if (rawData == null) {
      throw NullResponseBody('');
    }

    return rawData;
  }
}
