import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String title;
  String author;

  InfoCard(this.title, this.author);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "${this.title}, ${this.author}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )),
      // color: Colors.blue,
    );
  }
}
