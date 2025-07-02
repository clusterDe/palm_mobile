import 'package:flutter/material.dart';
import 'package:palm_mobile/data/constant.dart';
import 'package:palm_mobile/helpers/url_launcher/url_launcher_helper.dart';
import 'package:palm_mobile/providers/books_detail/books_detail_provider.dart';
import 'package:palm_mobile/widget/consumer_state_data/consumer_state_data.dart';
import 'package:provider/provider.dart';
import '../../../providers/books/books_detail_data_provider.dart';
import 'image_section.dart';

class BooksDetailBody extends StatelessWidget {
  const BooksDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ConsumerStateData<BooksDetailProvider>(
      state: context.watch<BooksDetailProvider>().stateBooksDetail!,
      message: context.watch<BooksDetailProvider>().msgStateBooksDetail,
      enumValue: ResultBooksDetailState.values,
      builder: (context, booksDetailProv, _) {
        var booksDetailData = booksDetailProv.booksDetailData;
        if (booksDetailData != null) {
          return ListView(
            padding: EdgeInsets.all(defPadding),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              ImageSection(booksDetailData: booksDetailData),
              SizedBox(height: defPadding),
              Text(booksDetailData.title ?? '-'),
              SizedBox(height: defPadding),
              Builder(
                builder: (context) {
                  if (booksDetailData.authors != null) {
                    return Wrap(
                      children: List.generate(
                        booksDetailData.authors!.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: defPadding / 2,
                          children: [
                            Text(booksDetailData.authors?[index].name ?? '-'),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${booksDetailData.authors?[index].birthYear ?? '-'}',
                                  ),
                                  TextSpan(text: ' - '),
                                  TextSpan(
                                    text:
                                        '${booksDetailData.authors?[index].deathYear ?? '-'}',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: defPadding),
              Builder(
                builder: (context) {
                  if (booksDetailData.summaries != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: defPadding / 2,
                      children: [
                        Text(
                          'Summaries',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ...List.generate(
                          booksDetailData.summaries!.length,
                          (index) => Text(booksDetailData.summaries![index]),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: defPadding),
              Builder(
                builder: (context) {
                  if (booksDetailData.subjects != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: defPadding / 2,
                      children: [
                        Text(
                          'Subjects',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ...List.generate(
                          booksDetailData.subjects!.length,
                          (index) => Text(booksDetailData.subjects![index]),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: defPadding),
              Builder(
                builder: (context) {
                  if (booksDetailData.bookshelves != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: defPadding / 2,
                      children: [
                        Text(
                          'Bookshelves',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ...List.generate(
                          booksDetailData.bookshelves!.length,
                          (index) => Text(booksDetailData.bookshelves![index]),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: defPadding),
              Builder(
                builder: (context) {
                  if (booksDetailData.languages != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: defPadding / 2,
                      children: [
                        Text(
                          'Languages',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ...List.generate(
                          booksDetailData.languages!.length,
                          (index) => Text(booksDetailData.languages![index]),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: defPadding),
              Text('Copyright : ${booksDetailData.copyright! ? 'Yes' : 'No'}'),
              SizedBox(height: defPadding),
              Builder(
                builder: (context) {
                  if (booksDetailData.formats != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Formats',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData.formats?.applicationEpubZip !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.applicationEpubZip}',
                                  );
                                },
                                child: Text(
                                  booksDetailData.formats?.applicationEpubZip ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData
                                    .formats
                                    ?.applicationOctetStream !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.applicationOctetStream}',
                                  );
                                },
                                child: Text(
                                  booksDetailData
                                          .formats
                                          ?.applicationOctetStream ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData.formats?.applicationRdfXml !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.applicationRdfXml}',
                                  );
                                },
                                child: Text(
                                  booksDetailData.formats?.applicationRdfXml ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData
                                    .formats
                                    ?.applicationXMobipocketEbook !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.applicationXMobipocketEbook}',
                                  );
                                },
                                child: Text(
                                  booksDetailData
                                          .formats
                                          ?.applicationXMobipocketEbook ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData.formats?.imageJpeg != null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.imageJpeg}',
                                  );
                                },
                                child: Text(
                                  booksDetailData.formats?.imageJpeg ?? '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData.formats?.textHtml != null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.textHtml}',
                                  );
                                },
                                child: Text(
                                  booksDetailData.formats?.textHtml ?? '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData
                                    .formats
                                    ?.textHtmlCharsetIso88591 !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.textHtmlCharsetIso88591}',
                                  );
                                },
                                child: Text(
                                  booksDetailData
                                          .formats
                                          ?.textHtmlCharsetIso88591 ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData.formats?.textHtmlCharsetUtf8 !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.textHtmlCharsetUtf8}',
                                  );
                                },
                                child: Text(
                                  booksDetailData
                                          .formats
                                          ?.textHtmlCharsetUtf8 ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData.formats?.textPlainCharsetUtf8 !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.textPlainCharsetUtf8}',
                                  );
                                },
                                child: Text(
                                  booksDetailData
                                          .formats
                                          ?.textPlainCharsetUtf8 ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData.formats?.textPlain != null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.textPlain}',
                                  );
                                },
                                child: Text(
                                  booksDetailData.formats?.textPlain ?? '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),

                        Builder(
                          builder: (context) {
                            if (booksDetailData
                                    .formats
                                    ?.textPlainCharsetIso88591 !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.textPlainCharsetIso88591}',
                                  );
                                },
                                child: Text(
                                  booksDetailData
                                          .formats
                                          ?.textPlainCharsetIso88591 ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Builder(
                          builder: (context) {
                            if (booksDetailData
                                    .formats
                                    ?.textPlainCharsetUsAscii !=
                                null) {
                              return TextButton(
                                onPressed: () {
                                  UrlLauncherHelper.launchWebView(
                                    urlData:
                                        '${booksDetailData.formats?.textPlainCharsetUsAscii}',
                                  );
                                },
                                child: Text(
                                  booksDetailData
                                          .formats
                                          ?.textPlainCharsetUsAscii ??
                                      '-',
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          );
        } else {
          return Center(child: Text('Empty'));
        }
      },
    );
  }
}
