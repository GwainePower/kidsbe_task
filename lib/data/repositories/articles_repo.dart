import '../api/articles_api.dart';
import '../db/db_service.dart';

import '../../domain/models/article.dart';

class ArticlesRepo {
  static final _articlesApi = ArticlesApi();

  Future<List<Article>> fetchArticles(String section) async {
    try {
      final result = await _articlesApi.getArticles(section.toLowerCase());
      DbService.db.insertArticles(result);
      return result;
    } catch (e) {
      return await DbService.db.getArticlesWhere(section: section);
    }
  }
}
