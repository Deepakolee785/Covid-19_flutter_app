import 'package:flutter/material.dart';

import '../constants.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function onTabClicked;

  MyBottomNavigationBar(
      {@required this.currentIndex, @required this.onTabClicked});
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (indexValue) {
        widget.onTabClicked(indexValue);
      },
      elevation: 25.0,
      iconSize: 30.0,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      unselectedLabelStyle: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w700,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          title: Text('FAQ'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: Text('Symptoms'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_incandescent),
          title: Text('Prevention'),
        ),
      ],
    );
  }
}
