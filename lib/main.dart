import 'package:covid19_flutter_app/screens/faq_page.dart';
import 'package:covid19_flutter_app/screens/home_page.dart';
import 'package:covid19_flutter_app/screens/prevention_page.dart';
import 'package:covid19_flutter_app/screens/symptoms_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'components/my_bottom_nav.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentTabIndex = 0;
  List<StatefulWidget> _screens = [
    HomePage(),
    FAQPage(),
    SymptomsPage(),
    PreventionPage(),
  ];
  void onTabClicked(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2b62ba).withOpacity(0.85),
    ));
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTabClicked: onTabClicked,
      ),
      body: _screens[_currentTabIndex],
    );
  }
}
