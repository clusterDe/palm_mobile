import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/routes/routes.dart';
import 'package:palm_mobile/screens/home/home_screen.dart';
import 'package:palm_mobile/screens/likes/likes_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.navigationShell});

  final Widget navigationShell;

  void _onTap(int index) {
    var context = navigatorKey.currentState!.context;
    switch (index) {
      case 0:
        context.replaceNamed(HomeScreen.routeName);
        break;
      case 1:
        context.replaceNamed(LikesScreen.routeName);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return navigationShell;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: 'Likes',
          ),
        ],
      ),
    );
  }
}
