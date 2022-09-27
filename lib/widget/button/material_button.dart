import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/values/dimensions.dart';
import 'package:linkedin_clone/widget/text_normal_widget.dart';
import 'package:linkedin_clone/widget/theme/widget/app_theme.dart';

class MaterialButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const MaterialButtonWidget(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;
    return MaterialButton(
      padding: EdgeInsets.all(
        padding16.r,
      ),
      minWidth: double.maxFinite,
      color: color.primary.primary,
      onPressed: onPressed,
      child: TextNormalWidget(
        title: title,
      ),
    );
  }
}
