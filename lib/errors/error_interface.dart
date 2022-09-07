import 'package:flutter/cupertino.dart';

abstract class ErrorInterface implements Exception {
  @protected
  final String? _message;
  @protected
  final String? _prefix;
  ErrorInterface(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix: $_message";
  }
}
