import 'package:flutter/material.dart';
import 'package:readview_app/screens/review_screen.dart';
import '../others/constants.dart';
import 'package:provider/provider.dart';
import 'package:readview_app/models/books_controller.dart';

class BrowseButton extends StatelessWidget {
  final text; // final is required because this is a stateless widget whcih means that their properties must be set only once and can't be change after. Also, when you wnat to edit a stateless widget, you have to delete it and tehn build it once again
  final red;
  final green;
  BrowseButton({this.text, this.red, this.green});
  //TODO: constants
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.white),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          print(Provider.of<BooksController>(context, listen: false)
              .getBooksByTitle(this.text)
              .quotes);
          Navigator.pushNamed(
              context,
              ReviewScreen
                  .route); //onPressed is a required parameter (due to @required decoratorr) and it takes arguments of type void Callback (anonymous functions which don't have a name) which are functions that have no arguments and return no data
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 17),
            child: Text(
              this.text,
              style: kBrowseButtonTextStyle,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(70, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          primary: Color.fromARGB(255, this.red, this.green, 208),
          elevation: 0,
        ),
      ),
    );
  }
}
