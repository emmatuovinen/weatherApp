import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          body: ListView(children: [
        Row(children: [
          SvgPicture.asset('images/heart.svg',
              height: 100, color: Colors.pinkAccent),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Favorite 1 here',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('And some other info here'),
          ])
        ]),
        Divider(),
        Row(children: [
          SvgPicture.asset('images/heart.svg',
              height: 100, color: Colors.pinkAccent),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Favorite 2 here',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('And some other info here'),
          ])
        ]),
        Divider(),
        Row(children: [
          SvgPicture.asset('images/heart.svg',
              height: 100, color: Colors.pinkAccent),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Favorite 3 here',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('And some other info here'),
          ])
        ]),
      ]));
}
