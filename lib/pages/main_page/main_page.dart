import 'package:dango/configs/constants.dart';
import 'package:dango/pages/main_page/diaries.dart';
import 'package:dango/pages/main_page/memos.dart';
import 'package:dango/pages/main_page/profile.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage ({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  BottomNavigationBarItem generateNavBarItem(Icon icon, String label) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          generateNavBarItem(Icon(Icons.view_list), DIARIES),
          generateNavBarItem(Icon(Icons.star), MEMOS),
          generateNavBarItem(Icon(Icons.person), PROFILE),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          DiariesPage(),
          MemosPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
