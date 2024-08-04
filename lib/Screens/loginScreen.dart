import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:seventhsemproject/Screens/homeScreen.dart';
import 'package:seventhsemproject/Screens/screen1.dart';
import 'package:seventhsemproject/Screens/signupScreen.dart';
import 'authService.dart';

class loginScreen extends StatelessWidget {
  final userForm = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: userForm,
          child: Container(
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
                  ), //login lekhya wala
                  SizedBox(height: 20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 15, 8),
                        child: Icon(
                          Icons.email,
                          size: 32,
                        ),
                      ),
                      label: Text('Email'),
                    ),
                  ), //username
                  SizedBox(height: 20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: password,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 15, 8),
                        child: Icon(
                          Icons.password,
                          size: 32,
                        ),
                      ),
                      label: Text('Password'),
                    ),
                  ), //password
                  SizedBox(height: 40),
                  SizedBox(
                    width: 300,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => homeScreen()),(route){return false;}
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
                  ), //login button
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider()),
                      Text("  OR  "),
                      Expanded(child: Divider()),
                    ],
                  ), //divider
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50.0,
                        width: 200.0,
                        child: OutlinedButton.icon(
                          onPressed: () => AuthService().signInWithGoogle((){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => homeScreen()),(route){return false;}
                            );
                          }),
                          icon: const Icon(Bootstrap.google),
                          label: const Text('Google'),
                        ),
                      ),
                    ],
                  ), //google fb github
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      InkWell(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signupScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
