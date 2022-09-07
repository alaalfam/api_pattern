import 'package:api_pattern/Errors/API/api_error_handler.dart';
import 'package:api_pattern/Services/API/api_provider_properties.dart';
import 'package:api_pattern/Services/Providers/safe_provider.dart';
import 'package:api_pattern/modules/test/apis/home_api.dart';
import 'package:flutter/material.dart';

class SecondPageProvider extends SafeProvider with APIProvider {
  BuildContext context;
  SecondPageProvider(this.context) {
    getUserInfo();
  }
  final _apiErrorHandler = APIErrorHandler();
  dynamic data;

  Future<void> getUserInfo() async {
    isLoading = true;
    notifyListeners();
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    // *** Get the data from the server ***
    data = await ProfileAPIValidation().getUserInfo(
        id: '#id',
        errorHandler: (error) => _apiErrorHandler.getErrorHandler(
              error: error,
              showSnackBar: true,
              scaffoldMessengerState: scaffoldMessengerState,
            ));
    hasError = data == null;
    isLoading = false;
    notifyListeners();
  }
}
