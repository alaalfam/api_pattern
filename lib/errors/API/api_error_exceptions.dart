import 'package:api_pattern/Errors/API/api_error_messages.dart';
import 'package:api_pattern/Errors/error_interface.dart';

class APIException implements ErrorInterface {
  final String _message;
  final String _prefix;
  APIException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix Exception! $_message";
  }
}

class FetchDataException extends APIException {
  FetchDataException(String message)
      : super(message, "Error During Communication");
}

class BadRequestException extends APIException {
  BadRequestException(message) : super(message, "Invalid Request");
}

class UnauthorizedException extends APIException {
  UnauthorizedException(message) : super(message, "Unauthorized");
}

class InvalidInputException extends APIException {
  InvalidInputException(String message) : super(message, "Invalid Input");
}

class InternalServerError extends APIException {
  InternalServerError(String message) : super(message, "Internal Server Error");
}

class NullResponse extends APIException {
  NullResponse(String message) : super(message, "Null Response");
}

class NullResponseBody extends APIException {
  NullResponseBody(String message) : super(message, "Null Response Body");
}

class ServerError extends APIException {
  ServerError(String message) : super(message, APIErrorMessages().serverError);
}
