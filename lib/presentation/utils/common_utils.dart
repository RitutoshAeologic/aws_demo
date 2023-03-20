import 'package:flutter/material.dart';
class CommonUtils {
  static const String _emailValidatorRegExp =
      r'^[a-zA-Z0-9+_.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

  static String? isValidateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please type your email.';
    }

    if (RegExp(_emailValidatorRegExp).hasMatch(email)) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  static String? isPasswordValid(String? password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return 'Please type your password.';
    }
    bool hasMinLength = password.length >= minLength;

    if (!hasMinLength) {
      return 'Your password must be at least 8 alphanumeric length.';
    }
    return null;
  }








  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}