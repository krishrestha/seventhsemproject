import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:seventhsemproject/Screens/screen1.dart';
import 'package:seventhsemproject/Screens/screen2.dart';
import 'package:seventhsemproject/Screens/screen3.dart';
import 'package:seventhsemproject/Screens/signupScreen.dart';



class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var user = FirebaseAuth.instance.currentUser;
  List<Widget> widgetList = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              Container(
                color: Colors.white70,
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Bootstrap.person_fill,),
                    SizedBox(height: 10,),
                    Text((user!.email ?? " ").toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout),
                onTap: ()async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => signupScreen()),(route){return false;}
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: Center(
          child: widgetList[_selectedIndex]
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[100],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box ),
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
