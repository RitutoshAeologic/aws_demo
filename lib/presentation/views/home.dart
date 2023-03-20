import 'package:aws_demo/data/repositories/remote/aws_auth.dart';
import 'package:flutter/material.dart';
import 'package:aws_demo/presentation/constants/color_constant.dart';
import 'package:aws_demo/presentation/constants/string_constant.dart';
import 'package:aws_demo/presentation/constants/typography_constant.dart';
import 'package:aws_demo/presentation/constants/route_constant.dart';



class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 AWSAuthRepo auth = AWSAuthRepo();
 final TextEditingController nameTextController = TextEditingController();
 final TextEditingController phoneNoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueGrey,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.lightBlueGrey,
        child:   GestureDetector(
        onTap: () async {
          auth.signOut();
          Navigator.pushNamed(context, Routes.signInScreen);
          },
          child: Container(
            key: const Key("signOutButton"),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                color: AppColors.mediumTeal),
          child: Center(
            child: Text(AppString.signOutText,
              style: AppTextStyle.text2,),
          ),),
      ),),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(AppString.homeAppText),
        centerTitle: true,
        backgroundColor: AppColors.mediumTeal,
      ),
      body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Center(
          child: Text(
            AppString.welcomeUserText,
        style: AppTextStyle.text4,
        ),
        ),
        )
                  );
  }
}
