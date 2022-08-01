import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articleUrl = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: WebView(
        initialUrl: articleUrl,
      ),
    );
  }
}
