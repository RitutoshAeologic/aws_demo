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

  static String? validateAndSignIn(String? email, String? password,
      [int minLength = 8]) {
    bool hasMinLength = password?.length == minLength;
    if (RegExp(_emailValidatorRegExp).hasMatch(email!) && hasMinLength) {
      return
        'Log In Success';
    }

    if (!RegExp(_emailValidatorRegExp).hasMatch(email) && !hasMinLength) {
      return 'please enter email and password in valid format';
    }
    if (RegExp(_emailValidatorRegExp).hasMatch(email) && !hasMinLength) {
      return 'please enter password in valid format';
    }
    if (!RegExp(_emailValidatorRegExp).hasMatch(email) && hasMinLength) {
      return 'please enter email in valid format';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? cPassword,
      [int minLength = 8]) {
    bool hasMinLength = password?.length == minLength;
    if (password == cPassword && hasMinLength) {
      return 'Password Match';
    }

    else if (password == cPassword && !hasMinLength) {
      return 'Your password must be at least 8 alphanumeric length.';
    }
    else if (password != cPassword && hasMinLength) {
      return 'Password not match';
    }
    else if (password != cPassword && !hasMinLength) {
      return 'password not matched and less than 8 alphanumeric length';
    }
    return null;
  }

  static String? validateAndSignUp(String? email, String? password,
      String? cPassword, [int minLength = 8]) {
    bool hasMinLength = password?.length == minLength;
    if (RegExp(_emailValidatorRegExp).hasMatch(email!) &&
        password == cPassword && hasMinLength) {
      return 'Sign up successful';
    }

    if (RegExp(_emailValidatorRegExp).hasMatch(email) &&
        password == cPassword && !hasMinLength) {
      return 'Your password must be at least 8 alphanumeric length.';
    }
    if (RegExp(_emailValidatorRegExp).hasMatch(email) &&
        password != cPassword && hasMinLength) {
      return 'Password not match';
    }
    if (RegExp(_emailValidatorRegExp).hasMatch(email) &&
        password != cPassword && !hasMinLength) {
      return 'password not matched and less than 8 alphanumeric length';
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