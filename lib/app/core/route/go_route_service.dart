import 'package:flutter/material.dart';
import 'package:weather_assesment/app/core/route/route_paths.dart';
import 'package:weather_assesment/app/module/weather/view/weather_main_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_assesment/app/utils/location/location_service.dart';

// GoRouter configuration
class GoRouterService {
  bool userIsNotLoggedIn = false;

static final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: RoutePaths.weatherMainPage,
      builder: (context, state) => const WeatherMainScreen(),
      redirect: (context, state) async {
        bool isPermissionGranted = await LocationService.isLocationPermissionGranted();
        if (isPermissionGranted) {
          return RoutePaths.weatherMainPage; // No redirection, proceed to WeatherMainScreen
        } else {
          // Location permission is not granted, redirect to another page
          return "/"; // Redirect to the initial location
        }
      },
    ),
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
