import 'pages/book_page.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca/pages/login_page.dart';

class BibliotecaApp extends StatelessWidget {
  const BibliotecaApp({super.key});

 @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Biblioteca Digital',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch:  Colors.blue,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
    ),
    initialRoute: '/home',
    routes: {
      '/login': (context) => const LoginPage(),
      '/home': (context) => const BookPage(),
    },
  );
}
}