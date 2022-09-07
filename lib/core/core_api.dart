import 'dart:convert';
import 'dart:io';

import 'package:api_pattern/Errors/API/api_error_handler.dart';
import 'package:api_pattern/Services/Local%20DB/storage.dart';
import 'package:http/http.dart';

export 'package:http/http.dart';

class CoreApi {
  CoreApi._();
  factory CoreApi.getCoreAPI() => _coreAPI;

  static final _coreAPI = CoreApi._();
  final _client = Client();
  final serviceLogger = APIErrorHandler();
  final _serverTokenKey = 'access';
  final _tokenValue = Storage.instance.accessToken;
  final _headers = {
    HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
  };

  Future<Response?> get(
    Uri url, {
    Map<String, String>? headers,
    String? temporaryToken,
  }) async {
    final token = _tokenValue ?? temporaryToken;
    if (token != null) {
      _headers.addAll({_serverTokenKey: token});
    }
    try {
      return await _client.get(
        url,
        headers: _headers..addAll(headers ?? {}),
      );
    } catch (e) {
      serviceLogger.debugSLog(e);
      return null;
    }
  }

  Future<Response?> post(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? temporaryToken,
  }) async {
    final token = _tokenValue ?? temporaryToken;
    if (token != null) {
      _headers.addAll({_serverTokenKey: token});
    }
    try {
      return await _client.post(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: _headers..addAll(headers ?? {}),
      );
    } catch (e) {
      serviceLogger.debugSLog(e);
      return null;
    }
  }
}
