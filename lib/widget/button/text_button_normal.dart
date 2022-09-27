import 'package:flutter/material.dart';
import 'package:linkedin_clone/values/text_style.dart';

class TextButtonNormal extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const TextButtonNormal({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: mLabelStyle,
      ),
    );
  }
}
