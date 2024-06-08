import 'dart:developer';

import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/data/local/preference/preference_manager.dart';
import 'package:e_commerce/app/data/local/preference/preference_manager_impl.dart';
import 'package:e_commerce/app/module/home/view/home_page.dart';
import 'package:e_commerce/app/module/main_page/main_screen.dart';
import 'package:e_commerce/app/module/main_page/main_screen.dart';
import 'package:e_commerce/app/module/profile/view/profile_page.dart';
import 'package:e_commerce/app/module/user_auth/view/login_page.dart';
import 'package:e_commerce/app/module/user_auth/view/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/app/core/route/route_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

// GoRouter configuration
class GoRouterService {
  bool userIsNotLoggedIn = false;

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          var box = await Hive.openBox<String>('LOCAL_STORE');
          String? token = box.get('token');

          log('token has $token');

          if (token == null || token == "") return RoutePaths.loginPath;
          if (token != null || token != "") return RoutePaths.mainScreen;
          return null;
        },
      ),
      GoRoute(
          path: RoutePaths.loginPath,
          builder: (context, state) => const LoginPage()),
      GoRoute(
          path: RoutePaths.mainScreen,
          builder: (context, state) => const MainScreen()),
      GoRoute(
          path: RoutePaths.registrationScreen,
          builder: (context, state) => const RegistrationScreen()),
    ],
    // redirect: (context, state) async {
    //   // var box = await Hive.openBox<String>('LOCAL_STORE');
    //   // String? token = box.get('token');

    //   // log('token has $token');

    //   // if (token == null || token == "") return '/';
    //   // if (token != null || token != "") return RoutePaths.mainScreen;
    //   return null;
    // },
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
