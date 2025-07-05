import 'package:biblioteca/models/book_model.dart';
import 'package:biblioteca/widgets/BookDetailsModal.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Livro book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          builder: (_) => BookDetailsModal(book: book),
        );
      },
      child: Card(
        color: const Color.fromARGB(255, 63, 65, 221),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        shadowColor: const Color.fromARGB(255, 15, 3, 87),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem do livro
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  book.urlImagem,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 160,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Título
              Text(
                book.titulo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              // Autor (opcional)
              Text(
                book.autor ?? 'Autor desconhecido',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color.fromARGB(255, 247, 245, 245),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
