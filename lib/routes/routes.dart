import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:palm_mobile/screens/home/home_screen.dart';
import 'package:palm_mobile/screens/likes/likes_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter route = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: HomeScreen.routeName,
  restorationScopeId: HomeScreen.routeName,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: HomeScreen.routeName,
              name: HomeScreen.routeName,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: LikesScreen.routeName,
              name: LikesScreen.routeName,
              builder: (context, state) => LikesScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
