import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/models/article.dart';
import '../navigation/main_navigation.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMd().add_Hm();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 4),
          leading: SizedBox(
            width: 75,
            height: 75,
            child: Image.network(
              fit: BoxFit.cover,
              article.thumbnailStandard,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.auto_stories,
                size: 75,
              ),
            ),
          ),
          title: Text(article.title),
          subtitle: Text(article.articleAbstract),
          onTap: () => Navigator.of(context)
              .pushNamed(RouteNames.article, arguments: article.url),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            article.byline,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(dateFormat.format(article.publishedDate)),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
