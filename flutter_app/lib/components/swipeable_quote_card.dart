import 'package:flutter/material.dart';
import '../others/constants.dart';
import 'info_card.dart';

class SwipeableQuoteCard extends StatefulWidget {
  final quote;
  final author;
  final title;
  SwipeableQuoteCard(this.title, this.author, this.quote);

  @override
  State<SwipeableQuoteCard> createState() => _SwipeableQuoteCardState();
}

class _SwipeableQuoteCardState extends State<SwipeableQuoteCard>
    with SingleTickerProviderStateMixin {
  // late AnimationController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //       duration: Duration(seconds: 2),
  //       vsync:
  //           this); // this class acts like a ticker (required in vsync)  // this means reference the object of this class
  //   controller.forward(); // form 0 to 1 in default

  //   controller.addListener(() {
  //     setState(() {});
  //     // print(controller.value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 2),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 118, 113, 113),
            blurRadius: 4,
            offset: Offset(2, 2), // Shadow position
          ),
        ],
      ),

      // height: controller.value * 1000,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    widget.quote,
                    style: kQuoteTextStyle,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: InfoCard(widget.title, widget.author))
          ],
        ),
      ),
    );
  }
}
