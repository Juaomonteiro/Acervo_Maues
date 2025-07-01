class Book {
  final String id;
  final String isbn;
  final String title;
  final String summary;
  final String genre;
  final String author;
  final String publicationYear;
  final String pageCount;
  final String publisher;
  final String edition;
  final String imageUrl;
  final String language;
  final String format;
  final String dimensions;
  final String location;
  final String isRented;

  Book({required this.id, required this.isbn, required this.title, 
  required this.summary, required this.genre, required this.author, 
  required this.publicationYear, required this.pageCount, required this.publisher,
  required this.edition, required this.imageUrl, required this.language,
  required this.format, required this.dimensions, required this.location,
  required this.isRented });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      isbn: json['isbn'],
      title: json['title'],
      summary: json['summary'],
      genre: json['genre'],
      author: json['author'],
      publicationYear: json['publicationYear'],
      pageCount: json['pageCount'],
      publisher: json['publisher'],
      edition: json['edition'],
      imageUrl: json['imageUrl'],
      language: json['language'],
      format: json['format'],
      dimensions: json['dimensions'],
      location: json['location'],
      isRented: json['isRented'],
    );
  }
}
