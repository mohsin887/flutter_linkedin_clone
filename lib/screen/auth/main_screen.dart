import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/values/dimensions.dart';
import 'package:linkedin_clone/widget/button/material_button.dart';
import 'package:linkedin_clone/widget/button/outline_button_widget.dart';
import 'package:linkedin_clone/widget/button/text_button_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(padding12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/png/linkedLogo.png',
                height: 150.h,
                width: 150.w,
              ),
            ),
            const Spacer(),
            MaterialButtonWidget(
                onPressed: () {
                  context.go('/join');
                },
                title: 'Join Now'),
            SizedUtils.sizedBoxHeight10,
            OutLineButtonWidget(
              icon: SvgPicture.asset(
                'assets/images/svg/google.svg',
                height: 18.h,
                width: 18.w,
              ),
              onPressed: () {},
              title: '  Continue with Google',
            ),
            SizedUtils.sizedBoxHeight10,
            TextButtonWidget(
                onPressed: () {
                  context.go('/signInScreen');
                },
                title: 'Sign In'),
            SizedUtils.sizedBoxHeight10,
          ],
        ),
      ),
    );
  }
}
