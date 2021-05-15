import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/home/home.dart';
import 'widgets/settings/settings.dart';
import 'widgets/workout/add_workout_screen.dart';
import 'widgets/workout/perform_workout/perform_workout_screen.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (context) => SettingsPage(),
        );
      case '/workout':
        return MaterialPageRoute(
          builder: (context) => PerformWorkoutScreen(),
        );
      case '/add-workout':
        return MaterialPageRoute(
          builder: (context) => AddWorkoutScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
