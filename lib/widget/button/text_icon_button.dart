import 'package:flutter/material.dart';
import 'package:linkedin_clone/values/text_style.dart';

class TextIconButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final IconData iconData;
  const TextIconButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(iconData),
      label: Text(
        title,
        style: mLabelStyle,
      ),
    );
  }
}
