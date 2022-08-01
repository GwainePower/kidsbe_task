import 'package:dio/dio.dart';
import 'package:kidsbe_task/data/api/api_service.dart';

class SectionsApi {
  static final Dio _apiService = ApiService.init();

  Future<List<String>> getSections() async {
    final response = await _apiService.request(
      '/section-list.json',
    );

    if (response.statusCode == 200) {
      // print(response.data['results']);
      return (response.data['results'] as List)
          .map((sectionMap) => sectionMap['display_name'] as String)
          .toList();
    } else {
      throw Exception('Could not get sections list');
    }
  }
}
