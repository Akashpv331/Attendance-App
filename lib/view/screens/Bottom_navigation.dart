import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/screens/Home_page.dart';
import 'package:ziya_inter_project/view/screens/history.dart';
import 'package:ziya_inter_project/view/screens/leave_page.dart';
import 'package:ziya_inter_project/view/screens/profile.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    Historypage(),
    Leavepage(),
    Profilepage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroundColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right_outlined),
            label: 'Leave',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_sharp),
            label: 'Person',
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 4,
        selectedFontSize: 10,
        selectedItemColor: AppColors.lightblue,
        unselectedItemColor: AppColors.grey,
      ),
    );
  }
}
