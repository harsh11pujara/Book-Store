import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(textTheme: TextTheme(
      labelMedium: TextStyle(color: CustomColor.authenticationBodyText, fontFamily: 'Lato', fontWeight: FontWeight.w700, fontSize: 19,height: 1.5),
      labelSmall: TextStyle(color: CustomColor.authenticationBodyText, fontFamily: 'Lato', fontWeight: FontWeight.w400, fontSize: 15,height: 1.5),
      headlineLarge: TextStyle(color: CustomColor.headingText, fontFamily: 'Lato', fontWeight: FontWeight.w700, fontSize: 26,),
      bodyMedium: TextStyle(color: CustomColor.bookDetails, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 16),
      bodySmall: TextStyle(color: CustomColor.bookDetails, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14),
      displayLarge: TextStyle(color: CustomColor.bookDetails, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 26),
      displayMedium: TextStyle(color: CustomColor.bookDetails, fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 22),
      displaySmall: TextStyle(color: CustomColor.bookDetails, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 15),


    ));
  }
}

class CustomColor {
  static Color authenticationTextFieldColor = const Color(0xFFFFFFFF);
  static Color authenticationBodyText = const Color(0xFFFFFFFF);
  static Color authenticationButtonText = const Color(0xFF21242D);
  static Color headingText = const Color(0xFFFFFFFF);
  static Color primaryColor = const Color(0xFF2f689c);
  static Color bookDetails = const Color(0xFF21242D);
  static Color divider = const Color(0xFFE6E8EC);



}
