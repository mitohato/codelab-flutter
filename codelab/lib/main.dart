import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

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
  List<String> fruits = <String>[];

//  お気に入りかどうかの状態を管理するMap
  Map<String, bool> favorites = <String, bool>{};

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() async {
    var resp = await http.get('https://gist.githubusercontent.com/najeira/4ea8c4ca93570dfb1468fae5c8d6c616/raw/4d61f74e66e81b1336e965056a977fe7e906cf5a/fruits.json');
    setState(() {
      List<dynamic> list = json.decode(resp.body);
      fruits = list.map((dynamic elem) {
        return elem as String;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: fruits.map<Widget>((String fruit) {
          bool fav = favorites[fruit] ?? false;
          return new ListTile(
              title: new Text(fruit),
            trailing: new IconButton(
                icon: new FavIcon(fav: fav,),
                onPressed: () {

                  bool fav = favorites[fruit] ?? false;
                  setState(() {
                    favorites[fruit] = !fav;
                  });
                }
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FavIcon extends StatefulWidget {
  FavIcon({Key key, this.fav}) : super(key: key);

  final bool fav;

  @override
  State<StatefulWidget> createState() {
    return new FavIconState();
  }
}

class FavIconState extends State<FavIcon>
    with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      value: 1.0,
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FavIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fav != widget.fav) {
      controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ScaleTransition(
      scale: new CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut,
      ),
      child: new Icon(
        widget.fav ? Icons.favorite : Icons.favorite_border,
        color: widget.fav ? Colors.red : Colors.grey,
      ),
    );
  }
}
