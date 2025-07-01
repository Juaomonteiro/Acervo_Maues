import 'package:flutter/material.dart';
import '../controller/book_controller.dart';
import '../repository/book_repository.dart';
import '../services/book_service.dart';
import '../models/book_model.dart';
import '../widgets/book_tile.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  late final BookController _controller;
  late Future<List<Book>> _futureBooks;

  @override
  void initState() {
    super.initState();
    _controller = BookController(BookRepository(BookService()));
    _futureBooks = _controller.loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ACERVO DO GUARANÁ')),
      body: FutureBuilder<List<Book>>(
        future: _futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum livro encontrado.'));
          }

          final books = snapshot.data!;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookTile(book: books[index]);
            },
          );
        },
      ),
    );
  }
}
