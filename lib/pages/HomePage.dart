import 'dart:io';

import 'package:flutter/material.dart';
import 'package:videoder21/pages/browser.dart';
import 'package:videoder21/pages/download_platform_pages/YT_past_link.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        actions: [
          // ElevatedButton(
          //   onPressed: () => exit(0),
          //   autofocus: true,
          //   child: new Icon(Icons.backspace),
          // )
        ],
        title: Text("Videoder"),
      ),
      body: pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _currentindex,
        items: items21,
        onTap: (value) {
          setState(
            () {
              _currentindex = value;
            },
          );
        },
      ),
    );
  }

  List<Widget> pages = [
    PastLink(),
    Browserpage(),
  ];

  List<BottomNavigationBarItem> items21 = [
    BottomNavigationBarItem(
        icon: Icon(Icons.paste), label: 'paste'), //bottomnavigation button
    BottomNavigationBarItem(
        icon: Icon(Icons.signal_cellular_4_bar_rounded),
        label: 'YouTube'), // bottom navigation button
    // BottomNavigationBarItem(icon: Icon(Icons.web_asset_off), label: 'views your content '),
  ];
}
