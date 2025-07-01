import 'package:flutter/material.dart';
import 'package:palm_mobile/data/constant.dart';
import 'package:palm_mobile/providers/likes/likes_provider.dart';
import 'package:palm_mobile/widget/card_book/card_books.dart';
import 'package:palm_mobile/widget/consumer_state_data/consumer_state_data.dart';
import 'package:provider/provider.dart';

import '../../../providers/books/books_like_db_provider.dart';

class LikesBody extends StatelessWidget {
  const LikesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<LikesProvider>().refreshLikeBook();
      },
      child: ConsumerStateData<LikesProvider>(
        state: context.watch<LikesProvider>().stateLikeBook!,
        message: context.watch<LikesProvider>().msgLikeBook,
        enumValue: ResultBooksDetailState.values,
        builder: (context, likesProv, _) {
          var listLikeBooks = likesProv.listLikeBooks;

          if (listLikeBooks.isNotEmpty) {
            return CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: listLikeBooks.length,
                  itemBuilder: (context, index) {
                    return CardBooks(
                      press: () {
                        likesProv.goToDetail(listLikeBooks[index]);
                      },
                      title: listLikeBooks[index].title,
                      author: listLikeBooks[index].authors,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: defPadding / 2),
                ),
              ],
            );
          } else {
            return ListView(
              physics: AlwaysScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                SizedBox(height: sizeOf.height * 0.35),
                Center(child: Text('Empty')),
              ],
            );
          }
        },
      ),
    );
  }
}
