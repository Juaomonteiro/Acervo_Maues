import 'dart:core';
import 'package:biblioteca/models/book_model.dart';
import 'package:biblioteca/models/login_model.dart';

abstract class IConsumerApiService{
  Future<List<Livro?>> getAllBooks();
  Future<LoginResponse?> postLoginUser(String email, String senha);
  Future<String?> postRegisterUser(String nome, String email, String senha); 
}