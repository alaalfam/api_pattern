import 'package:api_pattern/Components/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SnackbarService {
  final margin = const EdgeInsets.only(
    bottom: 20,
    right: 20,
    left: 20,
  );
  final successColor = Colors.green;
  final errorColor = Colors.red;

  final successIcon = const Icon(
    Icons.check_rounded,
    color: Colors.white,
  );

  final erroIcon = const Icon(
    Icons.close_rounded,
    color: Colors.white,
  );

  void showSuccessSnackBar({
    required ScaffoldMessengerState scaffoldMessengerState,
    required String message,
    Color? color,
    Icon? icon,
    EdgeInsets? margin,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scaffoldMessengerState.removeCurrentSnackBar();
      scaffoldMessengerState.showSnackBar(
        CustomSnackBar().showMessage(
          message: message,
          color: color ?? successColor,
          icon: icon ?? successIcon,
          margin: margin ?? this.margin,
        ),
      );
    });
  }

  void showErrorSnackBar({
    required ScaffoldMessengerState scaffoldMessengerState,
    required String message,
    Color? color,
    Icon? icon,
    EdgeInsets? margin,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scaffoldMessengerState.removeCurrentSnackBar();
      scaffoldMessengerState.showSnackBar(
        CustomSnackBar().showMessage(
          message: message,
          color: color ?? errorColor,
          icon: icon ?? erroIcon,
          margin: margin ?? this.margin,
        ),
      );
    });
  }
}
