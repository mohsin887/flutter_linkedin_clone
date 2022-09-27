import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/widget/button/material_button.dart';
import 'package:linkedin_clone/widget/button/outline_button_widget.dart';
import 'package:linkedin_clone/widget/textform/text_form_widget.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/png/linkedLogo.png',
              height: 80.sp,
              width: 80.sp,
            ),
            Text(
              'Join LinkedIn',
              style: textTheme.headline1,
            ),
            const RawButtonWidget(),
            SizedUtils.sizedBoxHeight30,
            Text(
              'Email or Phone*',
              style: textTheme.bodyText2,
            ),
            TextFormWidget(
              controller: _emailController,
            ),
            SizedUtils.sizedBoxHeight30,
            MaterialButtonWidget(onPressed: () {}, title: 'Continue'),
            SizedUtils.sizedBoxHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Divider(
                    indent: 12,
                    thickness: 2,
                    endIndent: 10,
                  ),
                ),
                SizedUtils.sizedBoxHeight10,
                const Text('or'),
                SizedUtils.sizedBoxHeight10,
                const Expanded(
                  child: Divider(
                    indent: 12,
                    thickness: 2,
                    endIndent: 10,
                  ),
                ),
              ],
            ),
            SizedUtils.sizedBoxHeight30,
            OutLineButtonWidget(
              onPressed: () {},
              title: 'Sign with Google',
            ),
          ],
        ),
      ),
    );
  }
}

class RawButtonWidget extends StatelessWidget {
  const RawButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'or',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'sign in',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
