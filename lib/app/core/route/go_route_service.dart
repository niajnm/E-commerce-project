import 'dart:developer';

import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/data/local/preference/preference_manager.dart';
import 'package:e_commerce/app/module/home/view/home_page.dart';
import 'package:e_commerce/app/module/user_auth/view/login_page.dart';
import 'package:e_commerce/app/module/user_auth/view/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/app/core/route/route_paths.dart';
import 'package:e_commerce/app/module/weather/view/weather_main_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
class GoRouterService {
  bool userIsNotLoggedIn = false;

  static final router = GoRouter(
    redirect: (context, state) async {
      final userRepository = serviceLocator<PreferenceManager>();
      var token = await userRepository.getString('token');

      log('token has $token');

      // if (token == null || token == "") return '/';
      // if (token != null || token != "") return RoutePaths.weatherMainPage;
      return null;
    },
    initialLocation: '/',
    routes: [
     // GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(
          path: RoutePaths.registrationScreen,
          builder: (context, state) => const RegistrationScreen()),
      GoRoute(
          path: RoutePaths.weatherMainPage,
          builder: (context, state) => const WeatherMainScreen()),
      GoRoute(
          path: '/', builder: (context, state) => HomePage()),
      //   GoRoute(
    ],
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
