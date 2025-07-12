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
  final TextEditingController _searchController = TextEditingController();

  List<Livro> _allBooks = [];
  List<Livro> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _controller = BookController(ConsumerApiService());
    _futureBooks = _controller.loadBooks();
    _loadBooks();
  }

  void _loadBooks() async {
    final livros = await _controller.loadBooks();
    setState(() {
      _allBooks = livros.whereType<Livro>().toList();
      _filteredBooks = _allBooks;
    });
  }

  void _filterBooks(String title) async{
    var livros = await _controller.searchBooksByTitle(title);
    // if(livros.isEmpty){
    //   setState(() {
    //      _futureBooks = Future.value(livros);
    //   });
    // }
    setState(() {
      _allBooks = livros.whereType<Livro>().toList();
      _filteredBooks = _allBooks ;
      _futureBooks = Future.value(livros);
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
            padding: const EdgeInsets.fromLTRB(20,20,20,0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                hintText: 'Buscar Livros...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              controller: _searchController,
              onChanged: (value) => _filterBooks(_searchController.text),
            ),
          ),
          
          Expanded(
            flex: 1,
            child: _allBooks.isEmpty
                ? FutureBuilder<List<Livro?>>(
                    future: _futureBooks,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Erro: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return SingleChildScrollView(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 175),
                                Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/4076/4076549.png', // imagem de livro fofo
                                  width: 80,
                                  height: 80,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Nenhum livro encontrado.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return const SizedBox(); // This will be replaced by the GridView below once data loads
                    },
                  )
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
      )
    );
  }
}
