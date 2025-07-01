import 'package:flutter/material.dart';
import '../../models/books/components/books_result.dart';
import '../books/books_provider.dart';

class HomeProvider extends ChangeNotifier with BooksProvider {
  HomeProvider() {
    initController();
  }

  initController() {
    _fetchBooks();
    scrollCtrlBooks.addListener(_scrollListener);
  }

  final ScrollController scrollCtrlBooks = ScrollController();

  bool hasMore = true;
  bool isLoading = true;
  bool isRefreshingFirstTime = true;

  int _currentPage = 1;
  List<BooksResult> itemsBooks = [];

  void _scrollListener() async {
    if (scrollCtrlBooks.position.pixels >=
            scrollCtrlBooks.position.maxScrollExtent &&
        !isLoading &&
        hasMore) {
      await _fetchBooks();
    }
  }

  @override
  void dispose() {
    scrollCtrlBooks.dispose();
    super.dispose();
  }

  _fetchBooks() async {
    await getBooks(page: _currentPage);

    if (stateBooks == ResultBooksState.hasData && booksData?.results != null) {
      if (_currentPage == 1) {
        itemsBooks = booksData!.results!;
        notifyListeners();
      } else {
        itemsBooks.addAll(booksData!.results!);
        notifyListeners();
      }

      if (booksData?.next != null) {
        _currentPage++;
        notifyListeners();
      }

      isLoading = false;
      isRefreshingFirstTime = false;
    } else {
      isLoading = false;
      isRefreshingFirstTime = false;
      hasMore = false;
      notifyListeners();
    }
  }

  refreshBooks() async {
    _currentPage = 1;
    hasMore = true;
    isRefreshingFirstTime = true;
    notifyListeners();

    await _fetchBooks();
  }
}
