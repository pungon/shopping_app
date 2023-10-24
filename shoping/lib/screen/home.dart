
import 'package:flutter/material.dart';
import 'package:shoping/screen/MyAppBar.dart';
import 'package:shoping/screen/testS.dart';

import 'package:shoping/screen/homeScreen.dart';

class Home extends StatefulWidget {
const Home({ super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TestS(), // เพิ่มหน้าจออื่น ๆ ตามความต้องการ
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: const MyAppBar()
      ),
      body:_screens[_currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mode_edit),
          label: 'test',
        ),
        
      ],
    ),
    

    );

  }
}