import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/widget/button/material_button.dart';
import 'package:linkedin_clone/widget/textform/text_form_widget.dart';

import '../../../values/dimensions.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  bool _showHidePassword = true;
  bool _isContinue = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 300,
      ),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    // _heightAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(padding12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/png/linkedLogo.png',
              height: 80.sp,
              width: 80.sp,
            ),
            Text(
              _isContinue ? 'Set your password' : 'Add your email or phone',
              style: textTheme.headline1,
            ),
            SizedUtils.sizedBoxHeight20,
            Text(
              'Email or Phone*',
              style: textTheme.bodyText2,
            ),
            TextFormWidget(
              controller: _emailController,
              validator: (value) {
                _emailController.text = value!;

                if (value.isEmpty) {
                  debugPrint('value');
                  return 'Please enter your email or phone';
                }
                return null;
              },
            ),
            SizedUtils.sizedBoxHeight20,
            _isContinue
                ? const SizedBox.shrink()
                : MaterialButtonWidget(
                    onPressed: () {
                      setState(() {
                        _isContinue = !_isContinue;
                      });
                    },
                    title: 'Continue',
                  ),
            if (_isContinue)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password*',
                          style: textTheme.bodyText2,
                        ),
                        TextFormWidget(
                          obscureText: _showHidePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showHidePassword
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _showHidePassword = !_showHidePassword;
                              });
                            },
                          ),
                          controller: _pwdController,
                          validator: (value) {
                            _pwdController.text = value!;

                            if (value.isEmpty) {
                              debugPrint('value');
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be 6 character';
                            }
                            return null;
                          },
                        ),
                        SizedUtils.sizedBoxHeight10,
                        Text(
                          '6 or more characters',
                          style: TextStyle(
                            fontSize: fontSize10.sp,
                            color: Colors.black54,
                          ),
                        ),
                        SizedUtils.sizedBoxHeight10,
                        TermsConditionWidget(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      UserAgreementWidget(
                                        onPressed: () {},
                                        title: 'User Agreement',
                                      ),
                                      UserAgreementWidget(
                                        onPressed: () {},
                                        title: 'Privacy Policy',
                                      ),
                                      UserAgreementWidget(
                                        onPressed: () {},
                                        title: 'Cookie Policy',
                                      ),
                                      UserAgreementWidget(
                                        onPressed: () {},
                                        title: 'Text Notifications',
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SizedUtils.sizedBoxHeight20,
                        MaterialButtonWidget(
                          onPressed: () {},
                          title: 'Agree & Join',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              const SizedBox.square(),
          ],
        ),
      ),
    );
  }
}

class UserAgreementWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const UserAgreementWidget({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TermsConditionWidget extends StatelessWidget {
  final Function() onPressed;
  const TermsConditionWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          text: 'By clicking Agree & Join, you agree to the LinkedIn ',
          style: TextStyle(fontSize: fontSize10.sp),
          children: [
            TextSpan(
              text: 'User Agreement, Privacy Policy',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const TextSpan(
              text: ', and ',
            ),
            TextSpan(
              text: 'Cookie Policy',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const TextSpan(
              text:
                  '. For phone number signups we will send a verification code via SMS.',
            ),
          ],
        ),
      ),
    );
  }
}
