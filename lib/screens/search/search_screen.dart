import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          readOnly: true,
          onTap: () {},
          decoration: InputDecoration(hintText: 'Search'),
        ),
        centerTitle: true,
      ),
    );
  }
}
