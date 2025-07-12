import 'package:biblioteca/models/book_model.dart';
import 'package:biblioteca/services/interfaces/iconsumer_api_service.dart';

class BookController {
  final IConsumerApiService _service;

  BookController(this._service);

  Future<List<Livro?>> loadBooks() async {
    var bookList = await _service.getAllBooks();
    if(bookList.isEmpty){
      return List.empty();
    }
    return bookList;
  }
  Future<List<Livro?>> searchBooksByTitle(String title) async{
    var bookList = await _service.getBooksByTitle(title);
    if(bookList.isEmpty){
      return List.empty();
    }
    return bookList;
  }
}
