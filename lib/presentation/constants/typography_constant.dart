import 'dart:ui';
import 'package:flutter/material.dart';

import 'color_constant.dart';

class AppFontWeight {
  static const FontWeight fontBlack = FontWeight.w900;
  static const FontWeight fontExtraBold = FontWeight.w800;
  static const FontWeight fontBold = FontWeight.w700;
  static const FontWeight fontSemiBold = FontWeight.w600;
  static const FontWeight fontRegular = FontWeight.w500;
  static const FontWeight font1Regular = FontWeight.w400;
  static const FontWeight fontLight = FontWeight.w300;
}

mixin AppTextStyle{

  static  TextStyle text1 = const TextStyle(
      color: AppColors.black,
      fontSize: 22,
      fontWeight: AppFontWeight.fontRegular
  );

  static  TextStyle text2 = const TextStyle(
      color: AppColors.white,
      fontSize: 17,
      fontWeight: AppFontWeight.fontBold
  );

  static  TextStyle text3 = const TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontWeight: AppFontWeight.fontRegular
  );

  static  TextStyle text4 = const TextStyle(
      fontSize: 20,
      color: AppColors.mediumTeal,
      height: 1.4);
}