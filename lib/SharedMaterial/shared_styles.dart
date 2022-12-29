import 'package:mailing_system/SharedMaterial/shared_colors.dart';
import 'package:flutter/material.dart';

class SharedFonts {
  static TextStyle primaryStyleStyle = TextStyle(
      fontSize: 20,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'SourceSansPro');
  static TextStyle smallStyle = TextStyle(
      fontSize: 20,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.normal,
      fontFamily: 'SourceSansPro');
  static TextStyle thirdStyle = TextStyle(
      fontSize: 23,
      color: AppColors.thirdColor,
      fontWeight: FontWeight.normal,
      fontFamily: 'SourceSansPro');
  static TextStyle attachStyle = const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'SourceSansPro');
  static TextStyle AppBarStyle = TextStyle(
      fontSize: 25,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'SourceSansPro');
}
