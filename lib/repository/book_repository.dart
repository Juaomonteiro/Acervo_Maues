import '../models/book_model.dart';
import '../services/book_service.dart';

abstract class IBookRepository {
  Future<List<Book>> fetchBooks();
}

class BookRepository implements IBookRepository {
  final BookService _service;

  BookRepository(this._service);

  @override
  Future<List<Book>> fetchBooks() async {
    final response = await _service.getBooks();
    final List data = response.data;
    return data.map((json) => Book.fromJson(json)).toList();
  }
}
