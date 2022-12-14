import 'package:linkedin_clone/widget/theme/model/app_theme_mode.dart';

abstract class ThemeRepository {
  bool getIsThemeSetUp();

  AppThemeMode getMode();

  Future<void> setThemeMode(AppThemeMode mode);
}
