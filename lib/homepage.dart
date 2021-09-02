import 'package:flutter/material.dart';
import 'newpost.dart';
import 'package:fluty/views/home_page.dart';
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _counter = 0;


void _newpost(){
  Navigator.of(context).push(MaterialPageRoute(
    // we'll look at ColorDetailPage later
    builder: (context) => newpost(),
  ));
}

  void _nss(){
    Navigator.of(context).push(MaterialPageRoute(
      // we'll look at ColorDetailPage later
      builder: (context) => HomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('fff'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newpost,
        child: Icon(Icons.add_circle_rounded),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Text('Made for College Clubs'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              margin: EdgeInsets.all(70.0),
              padding: EdgeInsets.all(50.0),

            ),
            ListTile(
              title: Text('National Service Scheme'),
              leading: Icon(Icons.backpack),
              tileColor: Colors.blue,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_sharp,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: _nss
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Global Leaders Forum'),
              leading: Icon(Icons.backpack),
              tileColor: Colors.blue,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_sharp,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: _nss
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Animal Welfare CLub'),
              leading: Icon(Icons.backpack),
              tileColor: Colors.blue,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_sharp,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: _nss
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Enterpreuner club'),
              leading: Icon(Icons.backpack),
              tileColor: Colors.blue,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_sharp,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: _nss
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Radio Hub'),
              leading: Icon(Icons.backpack),
              tileColor: Colors.blue,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_sharp,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: _nss
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('CAP and Nature club'),
              leading: Icon(Icons.backpack),
              tileColor: Colors.blue,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_sharp,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: _nss
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('IEEE Students Chapter'),
              leading: Icon(Icons.nights_stay_sharp),
              tileColor: Colors.blue,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_sharp,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: _nss
                  ),
                ],
              ),


              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ) ;
  }
}