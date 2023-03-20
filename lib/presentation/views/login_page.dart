import 'package:aws_demo/data/repositories/remote/aws_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aws_demo/presentation/constants/color_constant.dart';
import 'package:aws_demo/presentation/constants/string_constant.dart';
import 'package:aws_demo/presentation/constants/typography_constant.dart';
import 'package:aws_demo/presentation/utils/common_utils.dart';
import 'package:aws_demo/presentation/widgets/textview_form.dart';
import 'package:aws_demo/presentation/constants/route_constant.dart';
import 'package:aws_demo/presentation/constants/icon_constant.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  AWSAuthRepo auth = AWSAuthRepo();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool validate = false;
  bool configuredAmplify = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void clearText(){
    emailTextController.clear();
    passwordTextController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.lightBlueGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: AppColors.mediumTeal,
        ),
        body:
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Text(AppString.loginPageText,
                      style: AppTextStyle.text1),
                  const SizedBox(height: 40,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
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
                  const SizedBox(height: 20,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: GrayGetTextField(
                        hint: 'Password',
                        obscure: true,
                        controller: passwordTextController,
                        isVisible: true,
                        onValidate: CommonUtils.isPasswordValid,
                        valueDidChange: (String? value) { if(validate){
                          _formKey.currentState!.validate();
                        } }, inputType: TextInputType.text,)
                  ),
                  const SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () async {
                      await auth.signIn(emailTextController.text.trim(), passwordTextController.text.trim(),context);
                      if(await auth.getCurrentUser(signedIn: true))
                      {
                        Navigator.pushNamed(context, Routes.welcomeScreen);
                      }


                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      height: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.mediumBlueGrey,
                        border: Border.all(color: AppColors.mediumTeal,width: 2)
                      ),
                      child: Center(
                        child: Text(AppString.loginText,
                          style: AppTextStyle.text4,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                Text( AppString.orWithText,
                  style: AppTextStyle.text3),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SizedBox(
                      height: 53,
                      child: TextButton(
                        onPressed: () async{
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
                            Text(AppString.signInWithGoogleText,
                              style: AppTextStyle.text4,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppString.doesNotHaveText),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, Routes.signUpScreen);
                          },
                          child:  const Text(AppString.signUpText,
                            style: TextStyle(color: AppColors.mediumTeal),)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    )
      );
  }
}
