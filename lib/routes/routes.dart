import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/providers/books_detail/books_detail_provider.dart';
import 'package:palm_mobile/providers/home/home_provider.dart';
import 'package:palm_mobile/providers/likes/likes_provider.dart';
import 'package:palm_mobile/screens/books_detail/books_detail_screen.dart';
import 'package:palm_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:palm_mobile/screens/home/home_screen.dart';
import 'package:palm_mobile/screens/likes/likes_screen.dart';
import 'package:provider/provider.dart';

import '../models/books/components/books_result.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter route = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: HomeScreen.routeName,
  restorationScopeId: HomeScreen.routeName,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return DashboardScreen(navigationShell: child, key: state.pageKey);
      },
      routes: [
        GoRoute(
          path: HomeScreen.routeName,
          name: HomeScreen.routeName,
          builder: (context, state) => ChangeNotifierProvider.value(
            value: HomeProvider(),
            child: HomeScreen(key: state.pageKey),
          ),
        ),
        GoRoute(
          path: LikesScreen.routeName,
          name: LikesScreen.routeName,
          builder: (context, state) => ChangeNotifierProvider.value(
            value: LikesProvider(),
            child: LikesScreen(key: state.pageKey),
          ),
        ),
      ],
    ),
    GoRoute(
      path: BooksDetailScreen.routeName,
      name: BooksDetailScreen.routeName,
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: BooksDetailProvider(booksData: state.extra as BooksResult),
          child: BooksDetailScreen(),
        );
      },
    ),
  ],
);
