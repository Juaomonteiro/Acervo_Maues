  import 'package:biblioteca/models/book_model.dart';
import 'package:biblioteca/models/login_model.dart';
import 'package:biblioteca/services/interfaces/iconsumer_api_service.dart';
import 'package:dio/dio.dart';

  class ConsumerApiService extends IConsumerApiService{
    static const String host = 'https://flutter-start-api.onrender.com';
    final Dio _dio = Dio(BaseOptions(baseUrl: host));

    @override
    Future<List<Livro?>> getAllBooks() async{
      try {
        var response = await _dio.get('/Book/books');
        
        if(response.statusCode != 200) {
          throw Exception("Erro ao obter livros");
        }
        final List data = response.data;
        return data.map((json) => Livro.fromJson(json)).toList();
      } catch (e) {
        return List.empty();
      }
    }

    @override
    Future<LoginResponse?> postLoginUser(String email, String senha) async{
      try{

        var response = await _dio.post('/Auth/login', data: {'Email': email, 'Senha': senha});
        if(response.statusCode != 200){
          throw Exception(response.statusMessage);
        }
        return LoginResponse.fromJson(response.data);
      }catch(e){
        return null;
      }
    }

    @override
    Future<bool> postRegisterUser(String nome, String email, String senha) async{
      try{
        var response = await _dio.post('/Auth/register', data: {'Nome': nome, 'Email': email, 'Senha': senha});
        if(response.statusCode != 201){
          throw Exception(response.statusMessage);
        }
        return true;
      }catch(e){
        return false;
      }
    }
    
    @override
    Future<List<Livro?>> getBooksByTitle(String title) async {
      try
      {
        var response = await _dio.get('Book/books/$title');
        if(response.statusCode !=200){
          throw Exception(response.statusMessage); 
        }
        final List data = response.data;
        return data.map((json) => Livro.fromJson(json)).toList();
      }
      catch(e){
       throw Exception(e); 
      }
    }
  }