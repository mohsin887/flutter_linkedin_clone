import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/values/dimensions.dart';
import 'package:linkedin_clone/widget/button/material_button.dart';
import 'package:linkedin_clone/widget/button/outline_button_widget.dart';
import 'package:linkedin_clone/widget/button/text_button_widget.dart';
import 'package:linkedin_clone/widget/textform/text_form_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  bool _showHidePassword = true;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(padding12.r),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/png/linkedLogo.png',
                    height: 80.h,
                    width: 80.w,
                  ),
                  const Spacer(),
                  TextButtonWidget(
                      onPressed: () {
                        context.go('/join');
                      },
                      title: 'Join now'),
                ],
              ),
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedUtils.sizedBoxHeight10,
              TextFormWidget(
                label: 'Email or Phone',
                controller: _emailController,
                validator: (value) {
                  _emailController.text = value!;
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  if (value.isEmpty) {
                    debugPrint('value');
                    return 'Please enter your email or phone';
                  }
                  return null;
                },
              ),
              SizedUtils.sizedBoxHeight10,
              TextFormWidget(
                label: 'Password',
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
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFF0E8C80),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Text(
                    'Remember me',
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Learn more',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              SizedUtils.sizedBoxHeight10,
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              SizedUtils.sizedBoxHeight20,
              MaterialButtonWidget(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    context.go('/tabScreen');
                  },
                  title: 'Continue'),
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
              SizedUtils.sizedBoxHeight10,
              OutLineButtonWidget(
                icon: SvgPicture.asset(
                  'assets/images/svg/google.svg',
                  height: 18.h,
                  width: 18.w,
                ),
                onPressed: () {},
                title: 'Sign in with Google',
              ),
              SizedUtils.sizedBoxHeight10,
              OutLineButtonWidget(
                icon: SvgPicture.asset(
                  'assets/images/svg/apple.svg',
                  height: 18.h,
                  width: 18.w,
                ),
                onPressed: () {},
                title: 'Sign in with Apple',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
