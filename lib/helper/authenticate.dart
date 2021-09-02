import 'package:flutter/material.dart';
import 'package:fluty/views/signin.dart';
import 'package:fluty/views/signup.dart';

class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {

  bool showSignIn = true;
  void toggleview(){
    setState(() {
      showSignIn= !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
     if(showSignIn){
      return signin(toggleview);
    }
     else{
       return signup(toggleview);
     }
  }
}
