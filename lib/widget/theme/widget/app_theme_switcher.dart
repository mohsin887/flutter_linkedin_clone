import 'package:flutter/material.dart';
import 'package:linkedin_clone/widget/theme/model/app_theme_mode.dart';
import 'package:linkedin_clone/widget/theme/repository/theme_repository.dart';

class AppThemeSwitcher extends InheritedWidget {
  final ThemeRepository themeRepository;
  final Function(AppThemeMode) onThemeSwitch;

  const AppThemeSwitcher({
    Key? key,
    required this.themeRepository,
    required this.onThemeSwitch,
    required Widget child,
  }) : super(key: key, child: child);

  static void setMode(BuildContext context, AppThemeMode mode) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AppThemeSwitcher>();
    if (result == null) {
      throw 'No AppThemeMode found in context';
    }

    result.themeRepository.setThemeMode(mode);
    result.onThemeSwitch(mode);
  }

  @override
  bool updateShouldNotify(AppThemeSwitcher oldWidget) => oldWidget != this;
}
