import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {

  static TextStyle? mainTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Almarai',
      );

  static const Color neutral900 = Color(0xff111827);
  static const Color neutral800 = Color(0xff1F2937);
  static const Color neutral700 = Color(0xff374151);
  static const Color neutral600 = Color(0xff4B5563);
  static const Color neutral500 = Color(0xff6B7280);
  static const Color neutral400 = Color(0xff9CA3AF);
  static const Color neutral300 = Color(0xffD1D5DB);
  static const Color neutral200 = Color(0xffE5E7EB);
  static const Color neutral100 = Color(0xffF4F4F5);

  static const Color primary900 = Colors.orangeAccent;
  static const Color primary800 = Color(0xffE61E29);
  static const Color primary700 = Color(0xffE93842);
  static const Color primary600 = Color(0xffEB5058);
  static const Color primary500 = Color(0xffED6A70);
  static const Color primary400 = Color(0xffF18289);
  static const Color primary300 = Color(0xffF49BA1);
  static const Color primary200 = Color(0xffF6B4B8);
  static const Color primary100 = Color(0xffF9CCCF);

  static const Color success = Color(0xff60c631);
  static const Color error = Color(0xffff472b);

  static const Color backgroundColor = Color(0xffFFFFFF);

  static const Color green = Color(0xff9dd165);
  static const Color yellow = Color(0xfffac44b);
  static const Color blue = Color(0xff5998e8);
  static const Color red = Color(0xffe44d5d);


  static const double font32 = 28;
  static const double font28 = 24;
  static const double font21 = 17;
  static const double font17 = 14;
  static const double font16 = 12;
  static const double font14 = 10;
  static const double font12 = 8;


  static ThemeData theme(BuildContext context) => ThemeData(
    primaryColor: primary900,  // Primary color for your app
    hintColor: neutral300,  // Accent color used for buttons, etc.

    scaffoldBackgroundColor: backgroundColor,

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary900,  // Default button color
      ),
    ),


    // Input decoration theme
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary900),
      ),
    ),

  );

  static void initSystemNavAndStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: backgroundColor,
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}
