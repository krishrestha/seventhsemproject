import 'package:flutter/material.dart';

class dashboadrState extends StatefulWidget {

  @override
  State<dashboadrState> createState() => _dashboadrStateState();
}

class _dashboadrStateState extends State<dashboadrState> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[100],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.read_more),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}