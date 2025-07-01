import '../models/book_model.dart';
import '../repository/book_repository.dart';

class BookController {
  final IBookRepository _repository;

  BookController(this._repository);

  Future<List<Book>> loadBooks() async {
    return await _repository.fetchBooks();
  }
}
