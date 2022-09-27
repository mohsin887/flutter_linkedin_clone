import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/values/dimensions.dart';
import 'package:linkedin_clone/widget/theme/widget/app_theme.dart';

class TextNormalWidget extends StatelessWidget {
  final String title;

  const TextNormalWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize22.sp,
        color: color.text.textSecondary,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
