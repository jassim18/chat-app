import 'package:flutter/material.dart';

class people extends StatefulWidget {
  @override
  _peopleState createState() => _peopleState();
}

class _peopleState extends State<people> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(

        title: Text('fff'),
      ),
      body:
      Center(
      child: Column(
        children: [

          SizedBox(
            height: 10,
          ),
          SizedBox(   //Use of SizedBox
            height: 5,
          ),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search a list'
          ),
        ),

          SizedBox(   //Use of SizedBox
            height: 30,
          ),
          Text('this is the chat with  people  page')
        ],
      ),),
    );
  }
}
