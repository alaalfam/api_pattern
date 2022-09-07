import 'package:api_pattern/Errors/API/api_error_handler.dart';
import 'package:flutter/foundation.dart';

class APIProvider {
  @protected
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  @protected
  set isLoading(bool newValue) => _isLoading = newValue;
  @protected
  bool _hasError = false;
  bool get hasError => _hasError;
  @protected
  set hasError(bool newvalue) => _hasError = newvalue;
  final _apiErrorHandler = APIErrorHandler();
  @protected
  APIErrorHandler get apiErrorHandler => _apiErrorHandler;
}
