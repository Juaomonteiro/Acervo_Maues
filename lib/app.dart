import 'package:flutter/material.dart';
import 'pages/book_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACERVO DO GUARANÁ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookPage(),
    );
  }
}
