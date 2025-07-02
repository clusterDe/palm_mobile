import 'package:flutter/material.dart';

import '../../data/api/api_helper.dart';
import '../../models/books/books_model.dart';

enum ResultBooksSearchState { loading, noData, hasData, error }

mixin BooksSearchProvider on ChangeNotifier {
  BooksModel? booksSearchData;

  ResultBooksSearchState? stateBooks;

  String msgStateBooks = '';

  getBooksSearch({required String text, String? page}) async {
    stateBooks = ResultBooksSearchState.loading;
    notifyListeners();

    try {
      var result = await ApiHelper.apiBooksSearch(searchText: text, page: page);

      if (result == null) {
        msgStateBooks = 'No data';
        stateBooks = ResultBooksSearchState.noData;
      } else {
        var booksModel = BooksModel.fromMap(result);

        booksSearchData = booksModel;
        stateBooks = ResultBooksSearchState.hasData;
      }
    } catch (e) {
      msgStateBooks = '$e';
      stateBooks = ResultBooksSearchState.error;
    } finally {
      notifyListeners();
    }
  }
}
