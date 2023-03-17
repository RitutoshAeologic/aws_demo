import 'package:aws_demo/data/repositories/remote/aws_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aws_demo/presentation/constants/color_constant.dart';
import 'package:aws_demo/presentation/constants/string_constant.dart';
import 'package:aws_demo/presentation/constants/typography_constant.dart';
import 'package:aws_demo/presentation/utils/common_utils.dart';
import 'package:aws_demo/presentation/widgets/textview_form.dart';
import 'package:aws_demo/presentation/constants/route_constant.dart';

class ConfirmationSignUP extends StatefulWidget {
  const ConfirmationSignUP({Key? key}) : super(key: key);

  @override
  State<ConfirmationSignUP> createState() => _ConfirmationSignUPState();
}

class _ConfirmationSignUPState extends State<ConfirmationSignUP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController confirmationTextController = TextEditingController();
  bool validate = false;
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
            title: Text("Confirmation Page"),
            backgroundColor: AppColors.mediumTeal,
          ),
          body:
          SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Text(AppString.confirmSignUpText,
                        style: AppTextStyle.text1),
                    const SizedBox(height: 40,),
                    FittedBox(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: AppColors.mediumBlueGrey
                          ),
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
                    const SizedBox(height: 30,),
                    FittedBox(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: AppColors.mediumBlueGrey
                          ),
                          child:
                          TextField(
                            controller: confirmationTextController,
                            decoration: const InputDecoration(
                              fillColor: AppColors.mediumBlueGrey,
                              filled: true,
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: AppColors.mediumTeal),
                              hintText: 'Confirmation Code',
                              isDense: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(height: 30,),
                GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState?.validate() ?? false)
                        {
                          if (confirmationTextController.text.isEmpty) {
                            CommonUtils.showSnackBar(context, 'Please Enter Confirmation Code');
                            return;}
                        else {
                          await AWSAuthRepo().signUpConfirmation(emailTextController.text.trim(), confirmationTextController.text.trim());
                          Navigator.pushNamed(context, Routes.welcomeScreen);
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.mediumTeal
                        ),
                        child: Center(
                          child: Text(AppString.submitText,
                            style: AppTextStyle.text2,),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
      ),
    );;
  }
}
