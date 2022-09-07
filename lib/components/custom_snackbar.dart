import 'dart:io';

import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar() : isAndroid = Platform.isAndroid;

  late final bool isAndroid;
  SnackBar showMessage({
    required String message,
    required Color color,
    EdgeInsets? margin,
    Icon? icon,
  }) {
    return SnackBar(
      content: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.clip,
              maxLines: 20,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection:
          isAndroid ? DismissDirection.horizontal : DismissDirection.vertical,
      elevation: 10,
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: margin,
    );
  }
}
