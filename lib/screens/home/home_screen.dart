import 'package:flutter/material.dart';
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
          decoration: InputDecoration(hintText: 'Search'),
        ),
        centerTitle: true,
      ),
      body: HomeBody(),
    );
  }
}
