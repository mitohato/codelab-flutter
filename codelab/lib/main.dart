import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App DOJO',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'リストビュー'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @String _data = '';

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() async {
    var resp = await http.get('https://gist.githubusercontent.com/najeira/4ea8c4ca93570dfb1468fae5c8d6c616/raw/4d61f74e66e81b1336e965056a977fe7e906cf5a/fruits.json');
    setState(() {
      _data = resp.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Text(_data),
      ),
    );
  }
}
