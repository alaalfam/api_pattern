import 'package:api_pattern/Errors/API/api_error_messages.dart';
import 'package:api_pattern/Services/API/api_timeouts.dart';
import 'package:api_pattern/Services/API/api_uri.dart';
import 'package:api_pattern/core/core_api.dart';

abstract class APIValidationTools {
  final coreAPI = CoreApi.getCoreAPI();
  final apiErrorMessages = APIErrorMessages();
  final apiURIs = APIURIs();
  final timeouts = APITimeouts();
}
