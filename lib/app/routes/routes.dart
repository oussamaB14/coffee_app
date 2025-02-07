// lib/core/routes/routes.dart
import 'package:coffee_app/presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import '../../presentation/pages/landing_screen.dart'; // Landing Screen
import '../../presentation/pages/home_screen.dart'; // Home Screen
import '../../presentation/pages/details_screen.dart'; // Details Screen
import '../../presentation/pages/order_screen.dart'; // Order Screen
import '../../presentation/pages/delivery_screen.dart'; // Delivery Screen

class AppRoutes {
  // Route names
  static const String landing = '/';
  static const String wrapper = '/wrapper';
  static const String home = '/home';
  static const String details = '/details';
  static const String order = '/order';
  static const String delivery = '/delivery';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landing:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case details:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(),
        );
      case order:
        return MaterialPageRoute(
          builder: (_) => OrderScreen(),
        );
      case delivery:
        return MaterialPageRoute(builder: (_) => const DeliveryScreen());
      case wrapper:
        return MaterialPageRoute(builder: (_) => const Wrapper());
      default:
        // Handle unknown routes
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
