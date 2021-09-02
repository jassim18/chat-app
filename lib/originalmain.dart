import 'package:flutter/material.dart';
import 'package:fluty/helper/helper.dart';
import 'package:fluty/views/chatrooms.dart';
import 'helper/constants.dart';
import 'homepage.dart';
import 'settings.dart';
import 'people.dart';
import 'views/signin.dart';



class originalmain extends StatefulWidget {
  originalmain({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _originalmain createState() => _originalmain();
}


class _originalmain extends State<originalmain> {
  int selectedPage = 0;

  final _pageOptions = [
    homepage(),
    chatrooms(),
    settings(),
  ];
  @override
   void initState(){
    getuserinfo();
    super.initState();
  }
  getuserinfo() async{
    Constants.myname = await HelperFunctions.getuserNameSharedPreference();
    setState(() {

    });

  }

@override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.group_rounded, size: 30), title: Text('Peep')),
            BottomNavigationBarItem(icon: Icon(Icons.settings_applications_rounded, size: 30), title: Text('Settings')),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },
        )



    );
  }
}


