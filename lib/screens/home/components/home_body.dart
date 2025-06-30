import 'package:flutter/material.dart';
import 'package:palm_mobile/data/constant.dart';
import 'package:palm_mobile/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

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
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverList.separated(
                  itemCount: itemsBooks.length + (homeProv.hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < itemsBooks.length) {
                      return Card.filled(
                        margin: EdgeInsets.symmetric(horizontal: defPadding),
                        elevation: 4,
                        borderOnForeground: false,
                        child: ListTile(
                          title: Text(itemsBooks[index].title ?? '-'),
                          subtitle: Wrap(
                            children: List.generate(
                              itemsBooks[index].authors!.length,
                              (index2) => Text(
                                itemsBooks[index].authors?[index2].name ?? '-',
                              ),
                            ),
                          ),
                        ),
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
                      SizedBox(height: defPadding),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
