import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_demo/data/repositories/remote/aws_auth.dart';
import 'package:aws_demo/presentation/constants/icon_constant.dart';
import 'package:aws_demo/presentation/constants/color_constant.dart';
import 'package:aws_demo/presentation/constants/string_constant.dart';
import 'package:aws_demo/presentation/constants/typography_constant.dart';
import 'package:aws_demo/presentation/utils/common_utils.dart';
import 'package:aws_demo/presentation/widgets/textview_form.dart';
import 'package:aws_demo/presentation/constants/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController cPasswordTextController = TextEditingController();
  bool validate = false;
  AWSAuthRepo auth = AWSAuthRepo();

  void clearText()
  {
    emailTextController.clear();
    passwordTextController.clear();
    cPasswordTextController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor:AppColors.lightBlueGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: AppColors.mediumTeal,
        ),
        body:  SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Text(AppString.signUpPageText,
                      style: AppTextStyle.text1),
                  const SizedBox(height: 40,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Center(
                      child:
                      GrayGetTextField(
                        hint: 'User Email',
                        obscure: false,
                        controller: emailTextController,
                        isVisible: false,
                        onValidate: CommonUtils.isValidateEmail,
                        valueDidChange: (String? value) {
                          if(validate){
                            _formKey.currentState!.validate();}
                        }, inputType: TextInputType.emailAddress,)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child:Center(
                      child:
                      GrayGetTextField(
                        hint: 'Password',
                        obscure: true,
                        controller: passwordTextController,
                        isVisible: true,
                        onValidate: CommonUtils.isPasswordValid,
                        valueDidChange: (String? value) {
                          if(validate){
                            _formKey.currentState!.validate();}
                        }, inputType: TextInputType.text,)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 51,
                    child:GrayGetTextField(
                        hint: 'Confirm Password',
                        obscure: true,
                        controller: cPasswordTextController,
                        isVisible: true,
                        onValidate: CommonUtils.isPasswordValid,
                      valueDidChange: (String? value) {
                          if(validate){
                            _formKey.currentState!.validate();}
                      }, inputType: TextInputType.text,),
                  ),
                  const SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () async {
                      if(_formKey.currentState?.validate() ?? false) {
                        if (_formKey.currentState!.validate() &&
                            cPasswordTextController.text !=
                                passwordTextController.text) {
                          CommonUtils.showSnackBar(context,
                              'Password not match');
                          return;
                        }
                        await auth.signUp(emailTextController.text.trim(),
                            passwordTextController.text.trim(), context);
                          Navigator.pushNamed(context, Routes.confirmationSignUpScreen);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      width: MediaQuery.of(context).size.width,
                      height: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.mediumBlueGrey,
                          border: Border.all(color: AppColors.mediumTeal,width: 2)
                      ),
                      child: Center(
                        child: Text(AppString.signUpText,
                          style: AppTextStyle.text4,)
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text( AppString.orWithText,
                      style: AppTextStyle.text3),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                      height: 53,
                      child: TextButton(
                        onPressed: ()async{
                         await auth.signInWithWebUI();
                         if(await auth.getCurrentUser(signedIn: true))
                         {
                           Navigator.pushNamed(context, Routes.welcomeScreen);
                         }
                         if (!mounted) return;
                        },
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                const BorderSide(color: AppColors.mediumTeal, width: 2)),
                            backgroundColor: MaterialStateProperty.all(AppColors.mediumBlueGrey),
                            foregroundColor: MaterialStateProperty.all(AppColors.mediumBlueGrey),
                            minimumSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 58)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0))),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 14),
                            ),
                            textStyle: MaterialStateProperty.all(AppTextStyle.text2)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcons.googlePng,
                              scale: 23,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                             Text(AppString.signUpWithGoogleText,
                              style: AppTextStyle.text4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                 const  SizedBox( height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppString.haveAccountText),
                      TextButton(
                          onPressed: (){
                        Navigator.pushNamed(context, Routes.signInScreen);
                      },
                          child:  const Text(AppString.loginText,
                            style: TextStyle(color: AppColors.mediumTeal),)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
