import 'package:biblioteca/models/login_model.dart';
import 'package:biblioteca/services/interfaces/iconsumer_api_service.dart';

class AuthController {
  final IConsumerApiService _service;

  AuthController(this._service);

  Future<LoginResponse?> loginUser(String email, String senha) async {
    try{
      var authResponse = await _service.postLoginUser(email, senha);
      if(authResponse == null) {
        throw Exception("Erro ao efetuar login");
      }
      return authResponse;
    }catch(ex){
      throw ex;
    }
  } 
}
