import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkedin_clone/screen/auth/join/email_screen.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/widget/button/material_button.dart';
import 'package:linkedin_clone/widget/textform/text_form_widget.dart';

import '../../../values/dimensions.dart';

class Join extends StatefulWidget {
  const Join({Key? key}) : super(key: key);

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  int _currentStep = 0;
  bool _showHidePassword = true;
  final bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(padding12.r),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/png/linkedLogo.png',
                height: 80.h,
                width: 80.w,
              ),
              Expanded(
                child: Stepper(
                  controlsBuilder: (context, ControlsDetails details) {
                    return const SizedBox.shrink();
                  },
                  type: StepperType.horizontal,
                  currentStep: _currentStep,
                  onStepTapped: (step) {
                    setState(() {
                      _currentStep = step;
                    });
                  },
                  // onStepContinue: () {
                  //   _currentStep < 2
                  //       ? setState(() {
                  //           _currentStep += 1;
                  //           _isActive = !_isActive;
                  //         })
                  //       : null;
                  // },
                  // onStepCancel: () {
                  //   _currentStep < 0 ? setState(() => _currentStep -= 1) : null;
                  // },
                  steps: [
                    Step(
                      title: const SizedBox.shrink(),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add your name',
                            style: textTheme.headline1,
                          ),
                          SizedUtils.sizedBoxHeight20,
                          Text(
                            'First name*',
                            style: textTheme.bodyText2,
                          ),
                          TextFormWidget(
                            controller: _fNameController,
                            validator: (value) {
                              _fNameController.text = value!;

                              if (value.isEmpty) {
                                debugPrint('value');
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                          SizedUtils.sizedBoxHeight20,
                          Text(
                            'Last name*',
                            style: textTheme.bodyText2,
                          ),
                          TextFormWidget(
                            validator: (value) {
                              _lNameController.text = value!;

                              if (value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                            controller: _lNameController,
                          ),
                          SizedUtils.sizedBoxHeight30,
                          MaterialButtonWidget(
                              onPressed: () {
                                _currentStep < 1
                                    ? setState(() => _currentStep += 1)
                                    : null;
                                // context.go('/emailScreen');
                              },
                              title: 'Continue'),
                        ],
                      ),
                    ),
                    Step(
                      isActive: _isActive,
                      title: const SizedBox.shrink(),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add your email or phone',
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
                          SizedUtils.sizedBoxHeight30,
                          MaterialButtonWidget(
                            onPressed: () {
                              _currentStep < 2
                                  ? setState(() => _currentStep += 1)
                                  : null;
                              // context.go('/emailScreen');
                            },
                            title: 'Continue',
                          ),
                        ],
                      ),
                    ),
                    Step(
                      isActive: _isActive,
                      title: const SizedBox.shrink(),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Set your password',
                            style: textTheme.headline1,
                          ),
                          SizedUtils.sizedBoxHeight20,
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
                            onPressed: () {
                              context.go('/signInScreen');
                            },
                            title: 'Agree & Join',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
