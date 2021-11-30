import 'dart:io';

import 'package:flutter/material.dart';
import 'package:videoder21/pages/HomePage.dart';
import 'package:videoder21/pages/downloader.dart';
import 'package:videoder21/pages/downloded_history.dart';

class PastLink extends StatefulWidget {
  const PastLink({Key? key}) : super(key: key);

  @override
  _PastLinkState createState() => _PastLinkState();
}

class _PastLinkState extends State<PastLink> {
  TextEditingController _textController = TextEditingController();
  var _text;
  var _urllist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text('YT Download Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: [
                    // text field for  pasting
                    TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: 'Paste YT Link',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    //download button
                    GestureDetector(
                      onTap: () {
                        if (_textController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("No Link Pasted")));
                        } else {
                          //Download Video
                          Download()
                              .downloadVideo(_textController.text.trim(),
                                  "Youtube Downloader")
                              .then(
                            (value) {
                              print("++++++++++++++++++++");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("completed")));
                            },
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Download",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                              20,
                            ),
                          ),
                          // below container is button of downloaded videos history page navigator
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TydownloadHistory(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.download,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //below button is exit from app button
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    alignment: Alignment.bottomRight,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.red,
                                      onPressed: () => exit(0),
                                      tooltip: 'Close app',
                                      child: new Icon(Icons.close),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
