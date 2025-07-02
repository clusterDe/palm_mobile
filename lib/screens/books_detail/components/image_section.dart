import 'package:flutter/material.dart';
import 'package:palm_mobile/providers/books_detail/books_detail_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/books/components/books_result.dart';
import '../../../widget/cache_image/cache_image.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.booksDetailData});

  final BooksResult? booksDetailData;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (booksDetailData?.formats?.imageJpeg != null) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                child: CacheImage(
                  url: '${booksDetailData?.formats?.imageJpeg}',
                ),
              ),
              Positioned(
                bottom: -25,
                right: 0,
                child: Consumer<BooksDetailProvider>(
                  builder: (context, bookDetailProv, _) {
                    var likes = bookDetailProv.likes;
                    var isLoading = bookDetailProv.isLoading;

                    return IconButton.filledTonal(
                      onPressed: () {
                        bookDetailProv.likeBook(booksDetailData!);
                      },
                      icon: Builder(
                        builder: (context) {
                          if (isLoading) {
                            return Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else {
                            return Icon(
                              likes ? Icons.favorite : Icons.favorite_border,
                              color: likes ? Colors.redAccent : null,
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
