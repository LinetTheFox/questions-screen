import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:questions_screen/screens/placeholder_screen.dart';
import 'package:questions_screen/screens/questions_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }

}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 1;
  final List<Widget> _children = [
    PlaceholderScreen(),
    QuestionScreen(),
    PlaceholderScreen(),
    PlaceholderScreen(),
    PlaceholderScreen(),
  ];
  
  _MainScreenState();

  void onBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: onBarTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home, color: Colors.black, size: 30,
              ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bolt, color: Colors.black, size: 30,
              ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.plusCircle, color: Colors.green, size: 40,
              ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.commentAlt, color: Colors.black, size: 30,
              ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.idBadge, color: Colors.black, size: 30,
              ),
            title: Text(""),
          ),
        ]
      ),
    );
  }
}