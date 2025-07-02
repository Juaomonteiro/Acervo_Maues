import '../models/book_model.dart';
import '../repository/book_repository.dart';

class BookController {
  final IBookRepository _repository;

  BookController(this._repository);

  Future<List<Livro>> loadBooks() async {
    return await _repository.fetchBooks();
  }
}
