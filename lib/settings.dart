import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        title: Text('fff'),
      ),
      body: Center(
      child: Column(
        children: [



            ListTile(
              title: Text('Account'),
              leading: Icon(Icons.account_circle_rounded),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: Colors.brown[900],
                      ),

                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notification_important),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.0,
                        color: Colors.brown[900],
                      ),

                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Privacy'),
              leading: Icon(Icons.privacy_tip_outlined),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.0,
                        color: Colors.brown[900],
                      ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Advanced Settings'),
              leading: Icon(Icons.settings_outlined),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: Colors.brown[900],
                      ),

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
    );
  }
}
