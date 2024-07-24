import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventhsemproject/Screens/loginScreen.dart';

class splashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Image.asset('assets/images/icon1.png'),
          ),
          Text('Start Learning From Today',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
          SizedBox(height: 80,),
          SizedBox(
            height: 50,
            width: 200,
              child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginScreen(),
                      ),
                    );
                    },
                  child: Text('Get Started',style: TextStyle(color: Colors.black),))
          )
        ],
      ),
    );
  }
}
