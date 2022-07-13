import 'dart:convert';
import 'package:http/http.dart' as http;

class Book {
  String title;
  String author;
  List<String> quotes;
  late List<int> quotesIndexList;

  Book({required this.title, required this.author, required this.quotes});

  static Future<List<Book>> getBooks() async {
    http.Response response =
        await http.get(Uri.parse('https://readview-api.herokuapp.com/'));

    var tempDict = json.decode(Utf8Decoder().convert(response.bodyBytes));
    // try {
    //   http.Response response =
    //       await http.get(Uri.parse('https://readview-api.herokuapp.com/'));
    //   if (response.statusCode == 200) {
    //     var tempDict = jsonDecode(response.body);
    //   }
    //   else{
    //     print("Error in API")
    //   }
    // } on SocketException {
    //   print("No internet connection");
    // }
    // on FormatException{print("Problem in json decoding")} catch (e) {}

    List<Book> books = [];
    List<String> quotes = [];
    for (int c1 = 0, c2 = 1;
        c1 < tempDict.length && c2 < tempDict.length;
        c1++, c2++) {
      Map bookDict1 = tempDict[c1.toString()];
      Map bookDict2 = tempDict[c2.toString()];
      quotes.add(bookDict1['Quote']);
      if (bookDict1['Title'] != bookDict2['Title']) {
        books.add(Book(
            title: bookDict1['Title'],
            author: bookDict1['Author'],
            quotes: quotes));
        quotes = [];
      }
      if (c2 + 1 == tempDict.length) {
        quotes.add(bookDict2['Quote']);
        books.add(Book(
            title: bookDict2['Title'],
            author: bookDict2['Author'],
            quotes: quotes));
        quotes = [];
      }
    }
    // for (Book book in books) {
    //   print("${book.title}, ${book.author}, ${book.quotes}");
    // }
    return books;
  }
}
