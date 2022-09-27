import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/values/dimensions.dart';

class TextButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontSize: fontSize18.sp,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
