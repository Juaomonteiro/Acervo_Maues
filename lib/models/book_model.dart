class Livro {
  final String id;
  final String isbn;
  final String titulo;
  final String resumo;
  final String genero;
  final String autor;
  final int anoPublicacao;
  final int numPaginas;
  final String editora;
  final String edicao;
  final String urlImagem;
  final String idioma;
  final String formato;
  final String dimensoes;
  final String localizacao;
  final bool estaAlugado;

  Livro({
    required this.id,
    required this.isbn,
    required this.titulo,
    required this.resumo,
    required this.genero,
    required this.autor,
    required this.anoPublicacao,
    required this.numPaginas,
    required this.editora,
    required this.edicao,
    required this.urlImagem,
    required this.idioma,
    required this.formato,
    required this.dimensoes,
    required this.localizacao,
    required this.estaAlugado,
  });

  factory Livro.fromJson(Map<String, dynamic> json) {
    return Livro(
      id: json['id'],
      isbn: json['isbn'],
      titulo: json['title'],
      resumo: json['summary'],
      genero: json['genre'],
      autor: json['author'],
      anoPublicacao: json['publicationYear'],
      numPaginas: json['pageCount'],
      editora: json['publisher'],
      edicao: json['edition'],
      urlImagem: json['imageUrl'],
      idioma: json['language'],
      formato: json['format'],
      dimensoes: json['dimensions'],
      localizacao: json['location'],
      estaAlugado: json['isRented'],
    );
  }
}
