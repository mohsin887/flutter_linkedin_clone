import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/routes/route.dart';
import 'package:linkedin_clone/screen/tabbar/tabscreen/home_screen.dart';
import 'package:linkedin_clone/utils/theme_data_utils.dart';
import 'package:linkedin_clone/widget/theme/data/repository/persisted_theme_repository.dart';
import 'package:linkedin_clone/widget/theme/repository/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widget/theme/widget/app_theme_manager.dart';

void main() {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();
    final themeRepository = PersistedThemeRepository(preferences);
    runApp(MultiRepositoryProvider(providers: [
      RepositoryProvider<ThemeRepository>(
        create: (context) => themeRepository,
      ),
    ], child: const MyApp()));
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _initializeNavKey();
  }

  void _initializeNavKey() async {
    while (_navKey.currentState == null) {
      await Future.delayed(const Duration(milliseconds: 25));
    }
    await _navKey.currentState?.pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AppThemeManager(
          child: MaterialApp.router(
            routeInformationProvider: Routes.goRoute.routeInformationProvider,
            routeInformationParser: Routes.goRoute.routeInformationParser,
            routerDelegate: Routes.goRoute.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'LinkedIn',
            theme: themeData(context),
          ),
        );
      },
    );
  }
}
