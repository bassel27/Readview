import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:readview_app/services/tts.dart';
import '../others/constants.dart';
import 'quote_cards_stack.dart';
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
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync:
            this); // this class acts like a ticker (required in vsync)  // this means reference the object of this class
    controller.forward(); // form 0 to 1 in default

    controller.addListener(() {
      setState(() {});
      // print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      verticalSwipe: true,
      onSwipeEnd: (position, details) {
        QuoteCardsStack.index++;
        TTS.stop(); //TODO: await??
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.7),
            width: 2,
          ),
        ),
        elevation: 1,
        child: Container(
          height: controller.value * 1000,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Text(
                            widget.quote,
                            style: kQuoteTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InfoCard(widget.title, widget.author)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
