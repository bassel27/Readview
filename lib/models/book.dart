class Book {
  String title;
  String author;
  List<dynamic> quotes;
  late List<int> quotesIndexList;

  Book({required this.title, required this.author, required this.quotes});

  @override
  String toString() {
    // TODO: implement toString
    return "title: " + this.title + " quotes: " + this.quotes[0];
  }
}
