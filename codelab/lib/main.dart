import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(title: new Text('A')),
          new ListTile(title: new Text('B')),
          new ListTile(title: new Text('C')),
          new ListTile(title: new Text('D')),
          new ListTile(title: new Text('E')),
          new ListTile(title: new Text('F')),
          new ListTile(title: new Text('G')),
          new ListTile(title: new Text('H')),
          new ListTile(title: new Text('I')),
          new ListTile(title: new Text('J')),
          new ListTile(title: new Text('K')),
          new ListTile(title: new Text('L')),
          new ListTile(title: new Text('M')),
          new ListTile(title: new Text('N')),
          new ListTile(title: new Text('O')),
          new ListTile(title: new Text('P')),
          new ListTile(title: new Text('Q')),
          new ListTile(title: new Text('R')),
          new ListTile(title: new Text('S')),
          new ListTile(title: new Text('T')),
          new ListTile(title: new Text('U')),
          new ListTile(title: new Text('V')),
          new ListTile(title: new Text('W')),
          new ListTile(title: new Text('X')),
          new ListTile(title: new Text('Y')),
          new ListTile(title: new Text('Z')),
        ],
      ),
    );
  }
}
