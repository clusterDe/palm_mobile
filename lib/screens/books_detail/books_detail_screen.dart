import 'package:flutter/material.dart';

import 'components/books_detail_body.dart';

class BooksDetailScreen extends StatelessWidget {
  static const String routeName = '/books-detail';
  const BooksDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books Detail'), centerTitle: true),
      body: BooksDetailBody(),
    );
  }
}
