import 'package:connect/screens/professional/proChats.dart';
import 'package:connect/screens/professional/reviews.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '_profile.dart';
import 'package:flutter/material.dart';

class proHome extends StatefulWidget {
  const proHome({super.key});

  @override
  State<proHome> createState() => _proHomeState();
}

class _proHomeState extends State<proHome> {
  var _currentPage = 1;

  var _pages = [
    Reviews(),
    Profile(),
    proChat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages.elementAt(_currentPage)),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromARGB(255, 31, 44, 52),
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.reviews),
              label: 'Reviews',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],
          currentIndex: _currentPage,
          selectedItemColor: Color.fromARGB(255, 2, 168, 132),
          unselectedItemColor: Color.fromARGB(255, 133, 150, 160),
          onTap: (int inIndex) {
            setState(() {
              _currentPage = inIndex;
            });
          },
        ),
      ),
    );
  }
}
