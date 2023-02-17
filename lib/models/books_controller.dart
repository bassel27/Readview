import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:readview_app/models/book.dart';

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
    final String response = await rootBundle.loadString('assets/result.json');
    final decodedDict = await json.decode(response);
    // TODO: handle error
    // http.Response response =
    //     await http.get(Uri.parse('https://readview-api.herokuapp.com/'));

    for (var book in decodedDict["data"]) {
      List<String> quotes = [];
      for (var quoteDict in book['quotes']) {
        quotes.add(quoteDict['quote']);
      }
      var mybook =
          Book(title: book['title'], author: book['author'], quotes: quotes);
      _books.add(mybook);
      print(mybook);
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
