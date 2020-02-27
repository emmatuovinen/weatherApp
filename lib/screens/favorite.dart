// import 'dart:js';

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
        body: getListView(),
      );
}

List<String> getListElements() {
  var items = List<String>.generate(3, (number) => "Favorite $number");
  return items;
}

Widget getListView() {
  var listItems = getListElements();
  var listView = ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      itemCount: getListElements().length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsetsDirectional.only(bottom: 20.0),
          leading: SvgPicture.asset(
            'images/heart.svg',
            color: Colors.pink,
          ),
          title: Text(listItems[index]),
          subtitle: Text(
              'Here is the selected information displayed about the favorite place'),
        );
      });
  return listView;
}
