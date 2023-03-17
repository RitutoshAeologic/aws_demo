import 'package:aws_demo/presentation/views/confirmation_sign_up.dart';
import 'package:aws_demo/presentation/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../views/login_page.dart';
import '../../views/signup_page.dart';
import '../route_constant.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LogInPage(title:'AWS Auth Demo'));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpPage(title: 'AWS Auth Demo',));
      case Routes.confirmationSignUpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ConfirmationSignUP());
      case Routes.welcomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}