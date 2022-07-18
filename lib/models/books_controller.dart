import 'package:readview_app/models/book.dart';
import 'package:readview_app/others/globals.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksController {
  List<Book> books = [];
  List<String> authors = [];
  List<String> titles = [];

  Future<List<Book>> fetchBookFromAPI() async {
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
        books.add(Book(
            title: bookDict1['Title'],
            author: bookDict1['Author'],
            quotes: quotes));
        quotes = [];
      }
      if (c2 + 1 == decodedDict.length) {
        quotes.add(bookDict2['Quote']);
        books.add(Book(
            title: bookDict2['Title'],
            author: bookDict2['Author'],
            quotes: quotes));
        quotes = [];
      }
    }
    return books;
  }

  List<String> getTitles() {
    for (Book book in books) {
      titles.add(book.title);
    }
    return titles;
  }
}
