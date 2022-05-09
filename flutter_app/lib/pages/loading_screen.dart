import 'package:flutter/material.dart';

class loadingScreen extends StatefulWidget {
  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "loadingScreen",
        ),
      ),
    );
  }
}
