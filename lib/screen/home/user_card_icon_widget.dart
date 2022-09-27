import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/values/text_style.dart';

class IconWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;
  const IconWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        SizedUtils.sizedBoxHeight5,
        Text(
          title,
          style: mLabelStyle,
        ),
      ],
    );
  }
}
