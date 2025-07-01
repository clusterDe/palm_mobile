import 'package:flutter/material.dart';

import '../../data/constant.dart';
import '../../models/books/components/author.dart';

class CardBooks extends StatelessWidget {
  const CardBooks({super.key, this.press, this.title, this.author});

  final VoidCallback? press;
  final String? title;
  final List<Author>? author;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.only(
        left: defPadding,
        right: defPadding,
        top: defPadding / 2,
      ),
      elevation: 4,
      borderOnForeground: false,
      child: ListTile(
        onTap: press,
        title: Text(title ?? '-'),
        subtitle: Builder(
          builder: (context) {
            if (author != null) {
              return Wrap(
                children: List.generate(
                  author!.length,
                  (index) => Text(author?[index].name ?? '-'),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
