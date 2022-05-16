class Book {
  String title;
  String author;
  List<String> quotes;
  int _bookIndex=0;

  Book(this.title, this.author, this.quotes);
  void nextQuote() {
    _bookIndex++;
  }

  String getQuote() {
    return '7';
  }
}


