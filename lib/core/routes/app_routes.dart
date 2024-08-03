import 'package:flutter/material.dart';

import 'package:flutter_challenge/presentation/bottom_navigation_bar/screens/bottom_navigation_bar_screen.dart';
import 'package:flutter_challenge/presentation/simpson/screens/home_screen.dart';

/// Routes map
class AppRoutes {
  static const initialRoute = 'bottomNavigationBarScreen';

  static final Map<String, Widget Function(BuildContext)> routes = {
    SimpsonListScreen.routeName: (_) => const SimpsonListScreen(),
    BottomNavigationBarScreen.routeName: (_) =>
        const BottomNavigationBarScreen(),
  };
}
