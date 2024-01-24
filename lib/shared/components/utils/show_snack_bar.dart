import 'package:flutter/material.dart';

import 'package:asuka/asuka.dart' as asuka;

class ShowSnackBar {
  // ignore: unused_element
  ShowSnackBar._(this._snackBar);

  late SnackBar _snackBar;

  factory ShowSnackBar.error(String message) =>
      ShowSnackBar._(asuka.AsukaSnackbar.alert(message));

  factory ShowSnackBar.success(String message) =>
      ShowSnackBar._(asuka.AsukaSnackbar.success(message));

  factory ShowSnackBar.warning(String message) =>
      ShowSnackBar._(asuka.AsukaSnackbar.warning(message));

  // ignore: deprecated_member_use
  void show() => asuka.showSnackBar(_snackBar);
}
