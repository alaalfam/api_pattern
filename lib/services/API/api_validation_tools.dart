import 'package:api_pattern/Errors/API/api_error_messages.dart';
import 'package:api_pattern/constants/api_timeouts.dart';
import 'package:api_pattern/constants/api_uri.dart';
import 'package:api_pattern/core/core_api.dart';

abstract class APIControllerTools {
  final coreAPI = CoreApi.getCoreAPI();
  final apiErrorMessages = APIErrorMessages();
  final apiURIs = APIURIs();
  final timeouts = APITimeouts();
}
