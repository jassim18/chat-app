import 'package:flutter/material.dart';
import 'package:fluty/helper/authenticate.dart';
import 'package:fluty/services/auth.dart';
import 'package:fluty/views/conversation.dart';
import 'signup.dart';
import 'signin.dart';
import 'search.dart';
import 'package:fluty/services/database.dart';
import 'package:fluty/helper/constants.dart';
import 'package:fluty/helper/helper.dart';
class chatrooms extends StatefulWidget {
  @override
  _chatroomsState createState() => _chatroomsState();
}

class _chatroomsState extends State<chatrooms> {




  AuthMethods authMethods = new AuthMethods();
  Stream chatRooms;

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                userName: snapshot.data.docs[index].data()['chatroomid']
                    .toString()
                    .replaceAll("_", "")
                    .replaceAll(Constants.myname, ""),
                chatRoomId: snapshot.data.docs[index].data()["chatroomid"],
              );
            })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myname = await HelperFunctions.getuserNameSharedPreference();
    DatabaseMethods().getUserChats(Constants.myname).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myname}");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/1.png",height: 50,),
        actions: [
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => authenticate()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16 ),
              child: Icon(Icons.exit_to_app),

            ),
          )

        ],
      ),
      body: Container(
        child: chatRoomsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => search()
          ));
        },
      ),

      );


  }
}
class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => conversation(
              chatroomid: chatRoomId,
            )
        ));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
