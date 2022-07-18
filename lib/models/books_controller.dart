import 'package:readview_app/models/book.dart';
import 'package:readview_app/others/globals.dart';

class BooksController {
  List<String> titles = [];

  getTitles() {
    for (Book book in booksGlobal) {
      titles.add(book.title);
    }
    return titles;
  }
}
