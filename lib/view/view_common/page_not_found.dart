import 'package:flutter/material.dart';

class PageNotFound extends StatefulWidget {
  @override
  _PageNotFoundState createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Container(
            margin: EdgeInsets.only(left: 8),
            alignment: FractionalOffset.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: Text(
            "Page Not Found",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(60),
            child: Text(
              "Sorry, the page you are looking for is not available",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
