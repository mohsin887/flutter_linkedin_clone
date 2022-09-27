import 'package:flutter/material.dart';
import 'package:linkedin_clone/widget/theme/widget/app_theme.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  const CustomAppBarWidget({
    Key? key,
    required this.title,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;
    return AppBar(
      backgroundColor: color.primary.primary,
      actions: action,
      title: Text(title),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
