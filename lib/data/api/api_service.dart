import 'package:dio/dio.dart';
import 'package:kidsbe_task/config/config.dart';

class ApiService {
  static Dio init() {
    final BaseOptions options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: 6000,
      receiveTimeout: 4000,
      method: 'GET',
      responseType: ResponseType.json,
      queryParameters: {'api-key': Config.apiKey},
    );
    return Dio(options);
  }
}
