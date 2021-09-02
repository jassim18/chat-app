import 'package:flutter/material.dart';
import 'package:fluty/helper/authenticate.dart';
import 'package:fluty/helper/helper.dart';
import 'package:fluty/originalmain.dart';
import 'package:fluty/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/signin.dart';
import 'helper/authenticate.dart';
//void main(){
  //runApp(MyApp());
//}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 bool userIsLoggedIn = false ;

  @override
  void iniState(){
    getLoggedInState();
    super.initState();
  }
   getLoggedInState()async {
     await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
       if(value != null) {
         setState(() {
           userIsLoggedIn = value;
         });
       }
     });
   }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutterdemo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white54,
      ),
      home: userIsLoggedIn   ?  originalmain() : authenticate()
    );
  }
}


