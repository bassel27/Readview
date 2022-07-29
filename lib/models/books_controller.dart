import 'dart:collection';
import 'package:readview_app/models/book.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksController {
  List<Book> _books = [];
  List<String> _authors = [];
  List<String> _titles = [];

  List<Book> get books {
    return UnmodifiableListView(_books);
  }

  List<String> get authors {
    if (_authors.isEmpty) {
      formAuthors();
    }
    return UnmodifiableListView(_authors);
  }

  List<String> get titles {
    if (_titles.isEmpty) {
      formTitles();
    }
    return UnmodifiableListView(_titles);
  }

  Future<void> fetchBooksFromAPI() async {
    // TODO: handle error
    http.Response response =
        await http.get(Uri.parse('https://readview-api.herokuapp.com/'));

    var decodedDict = json.decode(Utf8Decoder().convert(response.bodyBytes));
    print(decodedDict["data"]);
    List<String> quotes = [];
    for (var book in decodedDict["data"]) {
      for (var quote_dict in book['quotes']) {
        quotes.add(quote_dict['quote']);
      }
      _books.add(
          Book(title: book['title'], author: book['author'], quotes: quotes));
    }
  }

  void formTitles() {
    _titles = [];
    for (Book book in _books) {
      _titles.add(book.title);
    }
    _titles.sort();
  }

  void formAuthors() {
    _authors = [];
    for (Book book in _books) {
      if (!_authors.contains(book.author)) {
        _authors.add(book.author);
      }
    }
    _authors.sort();
  }

  List<Book> getBookByTitle(String title) {
    for (Book book in _books) {
      if (book.title == title) {
        return [book];
      }
    }
    return [];
  }

  List<Book> getBooksByAuthor(String author) {
    List<Book> booksByThisAuthor = [];
    for (Book book in _books) {
      if (book.author == author) {
        booksByThisAuthor.add(book);
      }
    }
    return booksByThisAuthor;
  }
}
