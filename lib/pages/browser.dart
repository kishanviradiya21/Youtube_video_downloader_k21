import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browserpage extends StatefulWidget {
  const Browserpage({Key? key}) : super(key: key);

  @override
  _BrowserpageState createState() => _BrowserpageState();
}

class _BrowserpageState extends State<Browserpage> {
  final link = "https://www.youtube.com";
  WebViewController? _conroller;

  bool _showDownloadButton = false;

  void checkUrl() async {
    if (await _conroller!.currentUrl() == "https://www.youtube.com") {
      setState(
        () {
          _showDownloadButton = false;
        },
      );
    } else {
      setState(
        () {
          _showDownloadButton = true;
        },
      );
    }
  }

  // WebViewController? get conroller => null;
  @override
  Widget build(BuildContext context) {
    checkUrl();
    return WillPopScope(
      onWillPop: () async {
        // ignore: unrelated_type_equality_checks
        if (await _conroller!.canGoBack()) {
          _conroller!.goBack();
        }
        return false;
      },
      child: Scaffold(
        body: WebView(
          // here we can also use the container for wrapping this UP ,, wrapping the Scaffold into Container
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
          allowsInlineMediaPlayback: true,
          onPageStarted: (link) {
            print(link);
          },
          onWebViewCreated: (container) {
            setState(() {
              _conroller = _conroller;
            });
          },
        ),
        // putting button for download the video
        floatingActionButton:
            _conroller?.currentUrl().toString() == "https://www.youtube.com/"
                ? Container()
                : FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {},
                    child: Icon(Icons.download),
                  ),
      ),
    );
  }
}
