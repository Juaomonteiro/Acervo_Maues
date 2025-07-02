import 'package:biblioteca/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsModal extends StatelessWidget {
  final Livro book;

  const BookDetailsModal({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 214, 204, 204),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(book.urlImagem, height: 200),
                ),
                const SizedBox(height: 16),
                Text(book.titulo, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Autor: ${book.autor}"),
                Text("Gênero: ${book.genero}"),
                Text("Ano: ${book.anoPublicacao}"),
                Text("Páginas: ${book.numPaginas}"),
                Text("Editora: ${book.editora}"),
                Text("Edição: ${book.edicao}"),
                Text("Idioma: ${book.idioma}"),
                Text("Formato: ${book.formato}"),
                Text("Dimensões: ${book.dimensoes}"),
                Text("Localização: ${book.localizacao}"),
                Text("Disponível: ${book.estaAlugado ? 'Não' : 'Sim'}"),
                const SizedBox(height: 12),
                const Text("Resumo:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(book.resumo),
              ],
            ),
          ),
        );
      },
    );
  }
}
