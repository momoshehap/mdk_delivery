import 'package:flutter/material.dart';
import 'package:MDKDelivery/presentation/screens/appMain_screen.dart';
import 'package:MDKDelivery/presentation/screens/customers_screen.dart';
import 'package:MDKDelivery/presentation/screens/home_screen.dart';
import 'package:MDKDelivery/presentation/screens/login_screen.dart';
import 'package:MDKDelivery/presentation/screens/notification_screen.dart';
import 'package:MDKDelivery/presentation/screens/settings_screen.dart';

import '../utils/strings.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case appMainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainAppScreen(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case customersScreen:
        return MaterialPageRoute(
          builder: (_) => const CustomersScreen(),
        );

      case notifyScreen:
        return MaterialPageRoute(
          builder: (_) => const NotifyScreen(),
        );
      case settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );

      // case orderSucces:
      //   return MaterialPageRoute(
      //     builder: (_) => const OrderSucces(),
      //   );
      default:
        return null;
    }
  }
}
