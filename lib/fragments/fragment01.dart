import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

class Fragment01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfoPage();
  }
}

class _InfoPage extends State<Fragment01> {
  //
  WebViewController _webViewController;
  String filePath = 'assets/info.html';

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
