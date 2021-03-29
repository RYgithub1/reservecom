import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: FittedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/images/stevejobs.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: Column(
          children: <Widget>[
            Text(
              'Hi,',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              'Steve Jobs',
              style:
                  TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                size: 20,
              ),
              color: Colors.blue,
              onPressed: () {
                print('comm: Notification');
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}