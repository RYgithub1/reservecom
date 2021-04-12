import 'package:flutter/material.dart';

import 'chart/chart_screen.dart';
import 'chat/chat_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'setup/setup_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      DashboardScreen(),
      ChartScreen(),
      ChatScreen(),
      SetupScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: <Widget>[
                  Text('Home', style: TextStyle(fontSize: 11)),
                  Text('ー'),
                ],
              ),
              activeIcon: Column(
                children: <Widget>[
                  Text('Home', style: TextStyle(fontSize: 11, color: Colors.blue)),
                  Text('ー', style: TextStyle(color: Colors.blue)),
                ],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: 'Chart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setup',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
        ),
      ),
    );
  }
}
