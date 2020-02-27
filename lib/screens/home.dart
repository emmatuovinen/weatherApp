import 'package:flutter/material.dart';
import 'currentLocation.dart';
import 'favorite.dart';
import 'search.dart';
// import 'imageStack.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  CurrentLocation currentLocation;
  // ImageStack imageStack;
  Search search;
  Favorite favorite;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    currentLocation = CurrentLocation();
    search = Search();
    favorite = Favorite();
    // imageStack = ImageStack();
    pages = [currentLocation, search, favorite];
    currentPage = currentLocation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome to Weather App'),
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        selectedItemColor: Colors.pink[400],
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('favorite'),
          ),
        ],
      ),
    );
  }
}
