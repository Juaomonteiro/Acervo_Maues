class LoginResponse {
  final int id;
  final String? nome;
  final String? email;
  final String? role;

  LoginResponse({
    required this.id,
    this.nome,
    this.email,
    this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      role: json['role'],
    );
  }
}
