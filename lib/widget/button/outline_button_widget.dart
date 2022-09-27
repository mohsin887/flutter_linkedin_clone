import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/values/dimensions.dart';

class OutLineButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Widget? icon;
  const OutLineButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.icon = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Colors.black54,
          ),
          padding: EdgeInsets.all(padding16.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.sp),
          ),
        ),
        onPressed: onPressed,
        icon: icon!,
        label: Text(
          title,
          style: TextStyle(
            fontSize: fontSize18.sp,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
