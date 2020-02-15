import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter WebView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => MyHomePage(),
        '/widget': (_) => new WebviewScaffold(
              url: 'https://collectors.jilsoft.net/',
              appBar: new AppBar(
                title: const Text('revenue'),
              ),
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Container(
                color: Colors.brown[100],
                child: const Center(child: Text('waiting ...')),
              ),
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final webView = FlutterWebviewPlugin();

  @override
  void initState() {
    webView.close();
    super.initState();
  }

  @override
  void dispose() {
    webView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('revenue'),
        backgroundColor: Colors.brown[300],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 100,
              height: 100,
              child: Image.asset('images/coat.png', fit: BoxFit.cover)),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: RaisedButton(
              child: Text('click to go'),
              color: Colors.yellow[50],
              onPressed: () {
                Navigator.of(context).pushNamed('/widget');
              },
            ),
          ),
        ],
      )),
    );
  }
}
