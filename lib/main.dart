import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_demo/data/repositories/remote/aws_auth.dart';
import 'package:aws_demo/presentation/constants/route_constant.dart';
import 'package:aws_demo/presentation/constants/routing/router.dart';
import 'package:aws_demo/presentation/views/login_page.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAmplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      setState(() =>
      _isAmplifyConfigured = true
      );
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: _isAmplifyConfigured ? const LogInPage(title: '',) :
        const Center(child: CircularProgressIndicator()),
         onGenerateRoute: RouterApp.generateRoute,
         initialRoute: Routes.signInScreen,
      );
  }
}

