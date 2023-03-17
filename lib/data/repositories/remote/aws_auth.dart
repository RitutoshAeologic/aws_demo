import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AWSAuthRepo {

  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    print('$user');
    return user;
  }

  Future<void> signUp(String email, String password) async{
    try {
      final CognitoSignUpOptions options = CognitoSignUpOptions();
    await Amplify.Auth.signUp(username: email, password: password, options: options);
  } on Exception{
      rethrow;
    }
  }

  Future<void> signUpConfirmation(String email, String confirmationCode ) async{
    try {
      await Amplify.Auth.confirmSignUp(username: email, confirmationCode: confirmationCode);
    } on Exception{
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await Amplify.Auth.signIn(username: email, password: password,);
      await Amplify.Auth.getCurrentUser();
    } on Exception {
      rethrow;
    }
  }

    Future<void> signOut() async {
      try{
        await Amplify.Auth.signOut();
      }
      on Exception{
        rethrow;
      }
    }

  Future<void> signInWithWebUI() async{
    try {
      final result =
      await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      print('Result: $result');
    } on AmplifyException catch (e){
      print(e.message);
    }
  }
  }
