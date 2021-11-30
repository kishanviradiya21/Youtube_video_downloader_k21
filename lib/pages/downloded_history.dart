import 'package:flutter/material.dart';

class TydownloadHistory extends StatefulWidget {
  const TydownloadHistory({Key? key}) : super(key: key);

  @override
  _TydownloadHistoryState createState() => _TydownloadHistoryState();
}

class _TydownloadHistoryState extends State<TydownloadHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.select_all),
        ],
        backgroundColor: Colors.red,
        title: Text(
          'History ',
        ),
      ),
      body: Container(),
    );
  }
}
