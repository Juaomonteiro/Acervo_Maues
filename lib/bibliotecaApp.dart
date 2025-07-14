import 'package:biblioteca/pages/login_page.dart';
import 'package:biblioteca/pages/login_register_page.dart';
import 'package:flutter/material.dart';

import 'pages/book_page.dart';

class BibliotecaApp extends StatelessWidget {
  const BibliotecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Digital',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: Colors.white,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 67, 143, 156),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 67, 143, 156),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const LoginRegisterPage(),
        '/home': (context) => const BookPage(),
      },
    );
  }
}

