import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkedin_clone/screen/auth/join/email_screen.dart';
import 'package:linkedin_clone/screen/auth/join/join.dart';
import 'package:linkedin_clone/screen/auth/main_screen.dart';
import 'package:linkedin_clone/screen/auth/signin/sign_in_screen.dart';
import 'package:linkedin_clone/screen/auth/join_screen.dart';
import 'package:linkedin_clone/screen/tabbar/tab_bar_screen.dart';

class Routes {
  static final goRoute = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        path: '/joinScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const JoinScreen();
        },
      ),
      GoRoute(
        path: '/join',
        builder: (BuildContext context, GoRouterState state) {
          return const Join();
        },
      ),
      GoRoute(
        path: '/emailScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const EmailScreen();
        },
      ),
      GoRoute(
        path: '/signInScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: '/tabScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const TabBarScreen();
        },
      ),
    ],
  );
}

class RoutesName {
  static const joinScreen = '/joinScreen';

  static getRoutes() {
    return {
      joinScreen: (context) => const JoinScreen(),
    };
  }
}
