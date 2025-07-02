import 'package:flutter/material.dart';

import '../../models/books/components/books_result.dart';
import '../books/books_detail_data_provider.dart';
import '../books/books_like_db_provider.dart';

class BooksDetailProvider extends ChangeNotifier
    with BooksDetailDataProvider, BooksLikeDbProvider {
  BooksDetailProvider({BooksResult? booksData}) {
    saveBookdData(booksData);
  }

  BooksResult? _booksData;

  saveBookdData(BooksResult? data) async {
    if (data != null) {
      _booksData = data;
      notifyListeners();

      await getBooksDetail(id: '${_booksData?.id}');

      readBookDb();
    }
  }

  List<BooksResult> listLikeBooks = [];

  bool isLoading = false;

  changeValLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  bool likes = false;

  readBookDb() async {
    List<BooksResult> temp = [];

    changeValLoading();

    var list = await checkLikeBook();

    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        var booksResult = BooksResult.fromJson(element);

        temp.add(booksResult);
      }
    }

    listLikeBooks = temp;
    notifyListeners();

    var contains = listLikeBooks.contains(booksDetailData);

    if (contains) {
      likes = true;
      notifyListeners();
    } else {
      likes = false;
      notifyListeners();
    }

    changeValLoading();
  }

  likeBook(BooksResult book) async {
    await processLikeBook(book);
    await readBookDb();
  }
}
