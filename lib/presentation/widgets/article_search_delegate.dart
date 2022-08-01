import 'package:flutter/material.dart';

import '../../domain/models/article.dart';
import 'article_list_item.dart';

class ArticleSearchDelegate extends SearchDelegate {
  ArticleSearchDelegate({
    required this.articles,
  });

  final List<Article> articles;

  List<Article> searchResults = [];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query.isEmpty ? close(context, null) : query = '',
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) =>
            ArticleListItem(article: searchResults[index]),
        itemCount: searchResults.length,
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    searchResults = query.isNotEmpty
        ? articles.where((article) {
            final result = article.title.toLowerCase();
            final input = query.toLowerCase();
            return result.contains(input);
          }).toList()
        : [];

    return ListView.builder(
      itemBuilder: (context, index) =>
          ArticleListItem(article: searchResults[index]),
      itemCount: searchResults.length,
    );
  }
}
