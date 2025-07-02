import 'package:flutter/material.dart';
import 'package:palm_mobile/data/api/api_helper.dart';
import 'package:palm_mobile/models/books/components/books_result.dart';

enum ResultBooksDetailState { loading, noData, hasData, error }

mixin BooksDetailDataProvider on ChangeNotifier {
  BooksResult? booksDetailData;

  ResultBooksDetailState? stateBooksDetail;

  String msgStateBooksDetail = '';

  getBooksDetail({required String id}) async {
    stateBooksDetail = ResultBooksDetailState.loading;
    notifyListeners();

    try {
      var result = await ApiHelper.apiBooksDetail(id: id);

      if (result == null) {
        msgStateBooksDetail = 'No data';
        stateBooksDetail = ResultBooksDetailState.noData;
      } else {
        var booksResult = BooksResult.fromMap(result);

        booksDetailData = booksResult;
        stateBooksDetail = ResultBooksDetailState.hasData;
      }
    } catch (e) {
      msgStateBooksDetail = '$e';
      stateBooksDetail = ResultBooksDetailState.error;
    } finally {
      notifyListeners();
    }
  }
}
