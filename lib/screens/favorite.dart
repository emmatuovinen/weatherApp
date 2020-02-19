import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  Favorite({Key key}) : super(key: key);
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    debugPrint('favs');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Welcome to favorite screen')),
      body: ListView(children: [
        Text('Favorite here'),
        Text('And some other favorites here'),
      ]));
}
