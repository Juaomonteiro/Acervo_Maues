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
  final TextEditingController _searchController = TextEditingController();

  List<Livro> _allBooks = [];
  List<Livro> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _controller = BookController(ConsumerApiService());
    _loadBooks();
  }

  void _loadBooks() async {
    final livros = await _controller.loadBooks();
    setState(() {
      _allBooks = livros.whereType<Livro>().toList();
      _filteredBooks = _allBooks;
    });
  }

  void _filterBooks(String query) {
    final resultados = _allBooks.where((livro) {
      final titulo = livro.titulo?.toLowerCase() ?? '';
      return titulo.contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredBooks = resultados;
    });
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
                Color.fromARGB(255, 188, 205, 216),
                Color.fromARGB(255, 30, 118, 124),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: TextField(
              controller: _searchController,
              onChanged: _filterBooks,
              decoration: InputDecoration(
                hintText: 'Buscar livros...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          Expanded(
            child: _filteredBooks.isEmpty
                ? const Center(child: Text('Nenhum livro encontrado.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _filteredBooks.length,
                    itemBuilder: (context, index) {
                      return BookCard(book: _filteredBooks[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
