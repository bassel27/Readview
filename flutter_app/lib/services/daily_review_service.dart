import 'package:http/http.dart' as http;  // to clarify that get method is used from http package because it look like it's a user-defined function
import '/components/book.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

Future<String> fetchData({String url = "http://10.0.2.2:5000/?query=1"}) async {
  http.Response response = await http.get(Uri.parse(url));
  return response
      .body; // retruns JSON string that has to be decoded to be converted
}

void dailyReview(context, route) async {    //TODO: if record empty, last book
  List<Book> inistantiateClass(tempDict) {
    List<Book> books = [];
    List<String> quotes = [];
    for (int c1 = 0, c2 = 1;
        c1 < tempDict.length && c2 < tempDict.length;
        c1++, c2++) {
      Map bookDict1 = tempDict[c1.toString()];
      Map bookDict2 = tempDict[c2.toString()];
      quotes.add(bookDict1['Quote']);
      if (bookDict1['Title'] != bookDict2['Title']) {
        books.add(Book(bookDict1['Title'], bookDict1['Author'], quotes));
        quotes = [];
      }
      if (c2 + 1 == tempDict.length) {
        quotes.add(bookDict2['Quote']);
        books.add(Book(bookDict2['Title'], bookDict2['Author'], quotes));
        quotes = [];
      }
    }
    for (int i = 0; i < books.length; i++) {
      print("${books[i].title}, ${books[i].author}, ${books[i].quotes}");
    }
    return books;
  }

  final tempDict;
  Navigator.pushNamed(context, route);
  tempDict = jsonDecode(
    await fetchData(),
  ); // use await to make it know when the async called func is complete (even if this func has void return, you must return Future<void>)
  inistantiateClass(tempDict);

  // print(dic);
}
