import 'package:flutter/material.dart';

class newpost extends StatefulWidget {
  @override
  _newpostState createState() => _newpostState();
}

class _newpostState extends State<newpost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Add a new post'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextField(


                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:  'Club | College',
                  prefixIcon: Icon(Icons.school_rounded),

                ),
              ),
              ListTile(


                title: Text('Add your event poster'),
                leading: Icon(Icons.image),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.add,
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
              SizedBox(   //Use of SizedBox
                height: 5,
              ),

                  TextField(

                   maxLines: 8,

                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:  'Enter your Caption',

                    ),
                  ),

              TextField(


                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:  'Enter the Location',
                  prefixIcon: Icon(Icons.add_location_alt),

                ),
              ),
              TextField(


                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:  'Tag anyone',
                  prefixIcon: Icon(Icons.tag),

                ),
              ),


              ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Post'),
        icon: const Icon(Icons.note_add_sharp),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
