import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'homeScreen.dart';

class loginScreen extends StatelessWidget {
  TextEditingController _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/background.jpg'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text(
                  'Log In',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),//login lekhya wala
                SizedBox(height: 20),
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 15, 15, 8),
                      child: Icon(
                        Icons.person,
                        size: 32,
                      ),
                    ),
                    label: Text('UserName'),
                  ),
                ),//username
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 15, 15, 8),
                      child: Icon(
                        Icons.password,
                        size: 32,
                      ),
                    ),
                    label: Text('PassWord'),
                  ),
                ),//password
                SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),//login button
                SizedBox(height: 20,),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider()
                      ),
                    
                      Text("  OR  "),
                    
                      Expanded(
                          child: Divider()
                      ),
                    ]
                ),//divider
                SizedBox(height: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:50.0, width: 200.0,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Bootstrap.google),
                        label: const Text('Google'),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height:50.0, width: 200.0,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Bootstrap.facebook),
                        label: const Text('Facebook'),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height:50.0, width: 200.0,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Bootstrap.github),
                        label: const Text('Github'),
                      ),
                    ),
                  ],
                ),//google fb github
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(child: Text('Sign up',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homeScreen(),
                        ),
                      );
                    },)
                  ],
                )
              ]
            ),
          ),
        )
      )
    );
  }
}
