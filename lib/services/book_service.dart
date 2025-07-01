import 'package:dio/dio.dart';

class BookService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://flutter-start-api.onrender.com'));

  Future<Response> getBooks() async {
    try {
      return await _dio.get('/books');
    } catch (e) {
      rethrow;
    }
  }
}
