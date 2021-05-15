import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';
import 'providers/workout_provider.dart';
import 'router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Boilerplate Starter',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/add-workout',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
