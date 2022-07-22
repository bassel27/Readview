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

    List<String> quotes = [];
    for (int c1 = 0, c2 = 1;
        c1 < decodedDict.length && c2 < decodedDict.length;
        c1++, c2++) {
      Map bookDict1 = decodedDict[c1.toString()];
      Map bookDict2 = decodedDict[c2.toString()];
      quotes.add(bookDict1['Quote']);
      if (bookDict1['Title'] != bookDict2['Title']) {
        _books.add(Book(
            title: bookDict1['Title'],
            author: bookDict1['Author'],
            quotes: quotes));
        quotes = [];
      }
      if (c2 + 1 == decodedDict.length) {
        quotes.add(bookDict2['Quote']);
        _books.add(Book(
            title: bookDict2['Title'],
            author: bookDict2['Author'],
            quotes: quotes));
        quotes = [];
      }
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
        //TODO: one line
        List<Book> tempList = [book];
        return tempList;
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
