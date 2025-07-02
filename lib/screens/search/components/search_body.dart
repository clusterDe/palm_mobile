import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/data/constant.dart';
import 'package:palm_mobile/providers/search/search_provider.dart';
import 'package:provider/provider.dart';

import '../../../widget/card_book/card_books.dart';
import '../../books_detail/books_detail_screen.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProv, _) {
        var itemsBooksSearch = searchProv.itemsBooksSearch;

        if (searchProv.isRefreshingFirstTime && searchProv.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (itemsBooksSearch.isEmpty) {
          return Center(child: Center(child: Text('Empty')));
        } else {
          return CustomScrollView(
            controller: searchProv.scrollCtrlBooks,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverList.separated(
                itemCount:
                    itemsBooksSearch.length + (searchProv.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < itemsBooksSearch.length) {
                    return CardBooks(
                      press: () {
                        context.pushNamed(
                          BooksDetailScreen.routeName,
                          extra: itemsBooksSearch[index],
                        );
                      },
                      title: itemsBooksSearch[index].title,
                      author: itemsBooksSearch[index].authors,
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
          );
        }
      },
    );
  }
}
