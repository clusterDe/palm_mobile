import 'package:flutter/material.dart';
import 'components/likes_body.dart';

class LikesScreen extends StatelessWidget {
  static const String routeName = '/likes';
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Likes Book'), centerTitle: true),
      body: LikesBody(),
    );
  }
}
