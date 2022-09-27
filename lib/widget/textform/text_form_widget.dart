import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/values/dimensions.dart';

class TextFormWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? label;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const TextFormWidget({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.keyboardType,
    this.label = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: themeData.primaryColor,
        errorStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: fontSize12.sp,
        ),
      ),
      style: Theme.of(context).textTheme.headline6,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
