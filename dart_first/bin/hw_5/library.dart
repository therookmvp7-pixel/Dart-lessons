import 'book.dart';

class Library {
  String name;
  List<Book> _books = [];

  int get booksCount => _books.length;

  Library(this.name);

  void addBook(Book b) {
    _books.add(b);
  }

  void showBooks() {
    print('Library: $name');
    print('Books list:');
    for (int i = 0; i < _books.length; i++) {
      _books[0].title;
      print('${i + 1}. ${_books[i].title}');
    }
  }
}
