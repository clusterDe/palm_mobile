import 'package:flutter/material.dart';

import '../../models/books/components/books_result.dart';
import '../books/books_search_provider.dart';

class SearchProvider extends ChangeNotifier with BooksSearchProvider {
  SearchProvider() {
    initSearchProv();
  }

  initSearchProv() {
    scrollCtrlBooks.addListener(_scrollListener);
  }

  FocusNode searchFocusNode = FocusNode();

  TextEditingController searchCtrl = TextEditingController();

  final ScrollController scrollCtrlBooks = ScrollController();

  bool hasMore = true;
  bool isLoading = false;
  bool isRefreshingFirstTime = true;

  int _currentPage = 1;

  List<BooksResult> itemsBooksSearch = [];

  void _scrollListener() async {
    if (scrollCtrlBooks.position.pixels >=
            scrollCtrlBooks.position.maxScrollExtent &&
        !isLoading &&
        hasMore) {
      await fetchSearch();
    }
  }

  @override
  void dispose() {
    scrollCtrlBooks.dispose();
    super.dispose();
  }

  updateText(String value) async {
    searchCtrl.text = value;
    notifyListeners();
  }

  fetchSearch() async {
    searchFocusNode.unfocus();

    isLoading = true;
    notifyListeners();

    await getBooksSearch(text: searchCtrl.text, page: '$_currentPage');

    if (booksSearchData != null) {
      if (_currentPage == 1) {
        itemsBooksSearch = booksSearchData!.results!;
        notifyListeners();
      } else {
        itemsBooksSearch.addAll(booksSearchData!.results!);
        notifyListeners();
      }

      if (booksSearchData?.next != null) {
        _currentPage++;
        notifyListeners();
      }

      isLoading = false;
      isRefreshingFirstTime = false;
      notifyListeners();
    } else {
      isLoading = false;
      isRefreshingFirstTime = false;
      hasMore = false;
      notifyListeners();
    }
  }

  clearText() {
    searchCtrl.clear();
    notifyListeners();
    searchFocusNode.requestFocus();
  }
}
