import 'package:dio/dio.dart';

import 'api_service.dart';

import '../../domain/models/article.dart';

class ArticlesApi {
  static final Dio _apiService = ApiService.init();

  Future<List<Article>> getArticles(String section) async {
    final response = await _apiService.request(
      '/all/$section.json',
      queryParameters: {
        'limit': 40,
        'offset': 0,
      },
    );

    if (response.statusCode == 200) {
      // print(response.data['results']);
      return (response.data['results'] as List)
          .map((article) => Article.fromMap(article))
          .toList();
    } else {
      throw Exception('Could not get articles list');
    }
  }
}
