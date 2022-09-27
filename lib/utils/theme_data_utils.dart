import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeData(BuildContext context) {
  return Theme.of(context).copyWith(
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const Color(
            0xff0966C2,
          ),
        ),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(
        0xff0966C2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.sp),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontSize: 18.sp,
      ),
      bodyText2: TextStyle(
        fontSize: 18.0.sp,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: const Color(0xff0966C2),
  );
}
