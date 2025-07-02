import 'package:flutter/material.dart';

import '../../helpers/shared_pref_helper/shared_pref_helper.dart';
import '../../helpers/snackbar/custom_snackbar.dart';
import '../../models/books/components/books_result.dart';
import '../../routes/routes.dart';

enum ResultBooksDetailState { loading, noData, hasData, error }

mixin BooksLikeDbProvider on ChangeNotifier {
  final String _likeBooksKey = 'like-books-key';

  Future<List<String>?> checkLikeBook() async {
    var list = await SharedPrefHelper.readDataStringList(
      keyName: _likeBooksKey,
    );

    if (list != null) {
      return list;
    } else {
      return null;
    }
  }

  processLikeBook(BooksResult book) async {
    List<String> temp = [];

    var list = await checkLikeBook();

    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        var booksResult = BooksResult.fromJson(element);

        var contain = booksResult.id == book.id;

        if (contain) {
          var json = book.toJson();
          list.remove(json);
          await saveLikeBook(temp: list, message: 'Book unlike');
          return;
        }
      }
    }

    var json = book.toJson();
    temp.add(json);

    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        temp.add(element);
      }
    }

    await saveLikeBook(temp: temp, message: 'book like');
  }

  saveLikeBook({required List<String> temp, String? message}) async {
    var result = await SharedPrefHelper.writeDataStringList(
      keyName: _likeBooksKey,
      dataName: temp,
    );

    if (result) {
      var context = navigatorKey.currentState!.context;
      if (!context.mounted) return;
      CsnackBar.show(context, content: '$message');
    } else {
      var context = navigatorKey.currentState!.context;
      if (!context.mounted) return;
      CsnackBar.show(context, content: 'Failed like book');
    }
  }
}
