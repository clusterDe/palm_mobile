import 'package:flutter/material.dart';
import 'package:palm_mobile/data/api/api_helper.dart';
import 'package:palm_mobile/models/books/books_model.dart';

enum ResultBooksState { loading, noData, hasData, error }

mixin BooksProvider on ChangeNotifier {
  BooksModel? booksData;

  ResultBooksState? stateBooks;

  String msgStateBooks = '';

  getBooks({required int page}) async {
    stateBooks = ResultBooksState.loading;
    notifyListeners();

    try {
      var result = await ApiHelper.apiBooks(page: page);

      if (result == null) {
        msgStateBooks = 'No data';
        stateBooks = ResultBooksState.noData;
      } else {
        var booksModel = BooksModel.fromMap(result);

        booksData = booksModel;
        stateBooks = ResultBooksState.hasData;
      }
    } catch (e) {
      msgStateBooks = '$e';
      stateBooks = ResultBooksState.error;
    } finally {
      notifyListeners();
    }
  }
}
