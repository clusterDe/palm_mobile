import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/routes/routes.dart';
import 'package:palm_mobile/screens/home/home_screen.dart';
import 'package:palm_mobile/screens/likes/likes_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.navigationShell});

  final Widget navigationShell;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var currnetIndex = 0;

  void _onTap(int index) {
    var context = navigatorKey.currentState!.context;

    setState(() {
      currnetIndex = index;
    });

    switch (index) {
      case 0:
        context.goNamed(HomeScreen.routeName);
        break;
      case 1:
        context.goNamed(LikesScreen.routeName);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return widget.navigationShell;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currnetIndex,
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
