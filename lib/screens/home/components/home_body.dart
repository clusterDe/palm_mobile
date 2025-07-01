import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/screens/books_detail/books_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:palm_mobile/data/constant.dart';
import 'package:palm_mobile/providers/home/home_provider.dart';
import '../../../widget/card_book/card_books.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProv, _) {
        var itemsBooks = homeProv.itemsBooks;

        if (homeProv.isRefreshingFirstTime && homeProv.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (itemsBooks.isEmpty) {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              homeProv.refreshBooks();
            },
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [Center(child: Text('Empty'))],
            ),
          );
        } else {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              homeProv.refreshBooks();
            },
            child: CustomScrollView(
              controller: homeProv.scrollCtrlBooks,
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverList.separated(
                  itemCount: itemsBooks.length + (homeProv.hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < itemsBooks.length) {
                      return CardBooks(
                        press: () {
                          context.pushNamed(
                            BooksDetailScreen.routeName,
                            extra: itemsBooks[index],
                          );
                        },
                        title: itemsBooks[index].title,
                        author: itemsBooks[index].authors,
                      );
                    } else {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(defPadding),
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: defPadding / 2),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
