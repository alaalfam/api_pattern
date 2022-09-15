import 'dart:async';

import 'package:api_pattern/Validations/API/api_validation.dart';
import 'package:api_pattern/services/API/api_validation_tools.dart';

class ProfileAPIController extends APIControllerTools {
  Future<dynamic> getUserInfo({
    required String id,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      // API Call
      final response = await coreAPI
          .get(
            Uri.parse('${apiURIs.mainURI}${apiURIs.userProfile}$id'),
          )
          .timeout(timeouts.normalTimeout);

      // Validation
      final rawData = APIValidation().validation(
        response: response,
      );

      // Save Model
      return rawData['data'];
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
}
