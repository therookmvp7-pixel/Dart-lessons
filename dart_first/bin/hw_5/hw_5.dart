import 'book.dart';
import 'library.dart';

void main() {
  Book book1 = Book('Harry Potter', 'J.K. Rowling');
  book1.displayInfo();

  Book book2 = Book.withRating('Sherlock Holmes', 'Arthur Conan Doyle', 8.5);
  book2.displayInfo();

  Book book3 = Book('Test', 'Test Author');
  book3.rating = 6;
  book3.displayInfo();

  print('----------------------------------');

  Library citylibrary = Library('My Library');
  citylibrary.addBook(book1);
  citylibrary.addBook(book2);
  citylibrary.showBooks();
  print('Total books: ${citylibrary.booksCount}');
}
