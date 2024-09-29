
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';





class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
//
void main() async {



  // Replace this with the correct initialization method
  // gemini.correctInitializationMethod(apiKey: GEMINI_API_KEY);

  runApp(const MyApp());
}
//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USDT SHOP',

      home:  const WebPage(),
    );
  }
}





class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  _WebPagePageState createState() => _WebPagePageState();
}

class _WebPagePageState extends State<WebPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      ..loadRequest(Uri.parse("https://usdt-shop.net/"));
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USDT SHOP'),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
        ],
      ),
    );
  }
}