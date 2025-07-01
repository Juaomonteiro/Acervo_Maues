import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.author),
      leading: CircleAvatar(child: Text(book.id.toString())),
    );
  }
}
