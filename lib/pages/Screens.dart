import 'package:codeui/pages/HomeScreen.dart';
import 'package:codeui/pages/CalorieCounterScreen.dart';
import 'package:codeui/pages/imagePickerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../services/auth_service.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    HomeScreen(),
    ImagePickerScreen(),
    CalorieCounterScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavBarItem(Icons.home, 'Home', 0),
              buildNavBarItem(Icons.camera, 'Camera', 1),
              buildNavBarItem(Icons.add, 'counter', 2),
            ],
          ),
        ));
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? const Color(0xFF7861FF)
                : Colors.black87,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? const Color(0xFF7861FF)
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
