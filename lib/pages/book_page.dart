import 'package:biblioteca/services/consumer_api_service.dart';
import 'package:flutter/material.dart';
import '../controller/book_controller.dart';
import '../models/book_model.dart';
import '../widgets/book_tile.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  late final BookController _controller;
  late Future<List<Livro?>> _futureBooks;

  @override
  void initState(){
    super.initState();
    _controller = BookController(ConsumerApiService());
    _futureBooks = _controller.loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
  preferredSize: Size.fromHeight(kToolbarHeight),
  child: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 166, 189, 204), // Roxo
          Color(0xFF2575FC), // Azul
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: AppBar(
      title: const Text('Biblioteca Digital'),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  ),
),
      body: FutureBuilder<List<Livro?>>(
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
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookCard(book: books[index]!);
            },
          );
        },
      ),
    );
  }
}
