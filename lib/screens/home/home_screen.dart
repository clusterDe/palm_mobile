import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/screens/search/search_screen.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          readOnly: true,
          onTap: () {
            context.pushNamed(SearchScreen.routeName);
          },
          decoration: InputDecoration(hintText: 'Search'),
        ),
        centerTitle: true,
      ),
      body: HomeBody(),
    );
  }
}
