import 'package:flutter/material.dart';

class NotificationsServices {
  static late GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnakbar(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ));
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
