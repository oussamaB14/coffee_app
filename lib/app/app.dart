import 'package:coffee_app/app/routes/routes.dart';
import 'package:coffee_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Coffee App',
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRoutes.generateRoute, 
      initialRoute: AppRoutes.landing, 
      debugShowCheckedModeBanner: false,
    );
  }
}
