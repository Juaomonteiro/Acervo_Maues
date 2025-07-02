import 'package:biblioteca/models/book_model.dart';
import 'package:biblioteca/widgets/BookDetailsModal.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Livro book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BookDetailsModal(book: book),
        );
      },
      child: Column(
        children: [
          Image.network(
            book.urlImagem,
            height: 180,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            book.titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
