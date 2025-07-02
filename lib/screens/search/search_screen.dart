import 'package:flutter/material.dart';
import 'package:palm_mobile/providers/search/search_provider.dart';
import 'package:provider/provider.dart';

import 'components/search_body.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<SearchProvider>(
          builder: (context, searchProv, _) {
            return TextFormField(
              onChanged: (value) {
                searchProv.updateText(value);
              },
              onEditingComplete: () {
                searchProv.fetchSearch();
              },
              textInputAction: TextInputAction.search,
              focusNode: searchProv.searchFocusNode,
              controller: searchProv.searchCtrl,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Builder(
                    builder: (context) {
                      if (searchProv.searchCtrl.text.isEmpty) {
                        return Icon(Icons.search);
                      } else {
                        return SizedBox.square(
                          dimension: 20,
                          child: IconButton(
                            iconSize: 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              searchProv.clearText();
                            },
                            icon: Icon(Icons.close),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      body: SearchBody(),
    );
  }
}
