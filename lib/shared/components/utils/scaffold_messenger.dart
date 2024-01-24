import 'package:flutter/material.dart';

enum SnackBarType { success, error, warning, neutral }

void showSnackBar(
  BuildContext context, {
  required Widget content,
  SnackBarType type = SnackBarType.neutral,
  Duration duration = const Duration(seconds: 4),
}) {
  final snackBar = SnackBar(
    content: content,
    duration: duration,
    backgroundColor: type.color,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

extension _SnackBarTypeExtensions on SnackBarType {
  Color get color {
    switch (this) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.error:
        return Colors.red;
      case SnackBarType.warning:
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }
}
