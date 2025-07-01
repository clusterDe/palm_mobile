import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm_mobile/models/books/components/books_result.dart';
import 'package:palm_mobile/routes/routes.dart';
import '../../screens/books_detail/books_detail_screen.dart';
import '../books/books_like_db_provider.dart';

class LikesProvider extends ChangeNotifier with BooksLikeDbProvider {
  LikesProvider() {
    initProv();
  }

  initProv() async {
    await readBookDb();
  }

  List<BooksResult> listLikeBooks = [];

  ResultBooksDetailState? stateLikeBook;

  String msgLikeBook = '';

  readBookDb() async {
    List<BooksResult> temp = [];

    stateLikeBook = ResultBooksDetailState.loading;
    notifyListeners();

    var list = await checkLikeBook();

    if (list != null) {
      for (var element in list) {
        var booksResult = BooksResult.fromJson(element);

        temp.add(booksResult);
      }

      listLikeBooks = temp;
      stateLikeBook = ResultBooksDetailState.hasData;
      notifyListeners();
    } else {
      msgLikeBook = 'No Data';
      stateLikeBook = ResultBooksDetailState.noData;
      notifyListeners();
    }
  }

  refreshLikeBook() {
    readBookDb();
  }

  goToDetail(BooksResult book) async {
    var context = navigatorKey.currentState!.context;
    await context.pushNamed(BooksDetailScreen.routeName, extra: book);

    await readBookDb();
  }
}
