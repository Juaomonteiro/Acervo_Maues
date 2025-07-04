import 'pages/book_page.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca/pages/login_page.dart';

class BibliotecaApp extends StatelessWidget {
  const BibliotecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Digital',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(132, 62, 72, 209),
          centerTitle: true
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const BookPage(),
      },
    );
  }
}

