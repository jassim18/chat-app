import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluty/views/conversation.dart';

class DatabaseMethods {
  final String uid;
  DatabaseMethods({
    this.uid
  });


  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  getUserByEmail(String useremail) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: useremail)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users")
        .add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createchatroom(String chatroomid, chatroommap) {
    FirebaseFirestore.instance.collection("chatroom")
        .doc(chatroomid).set(chatroommap).catchError((e) {
      print(e.toString());
    });
  }
  addconversationmessages(String chatroomid, messagemap) async{
  await  FirebaseFirestore.instance.collection("chatroom")
        .doc(chatroomid).collection("chats").add(messagemap).catchError((e) {
      print(e.toString());
    });
  }
 getconversationmessages(String chatroomid) async {
    return await FirebaseFirestore.instance.collection("chatroom")
        .doc(chatroomid).collection("chats").orderBy('time').snapshots();
  }
  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatroom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }





  final CollectionReference groupCollection = FirebaseFirestore.instance.collection('groups');
  
  
  



  // create group
  Future createGroup(String userName, String groupName) async {
    DocumentReference groupDocRef = await groupCollection.add({
      'groupName': groupName,
      'admin': userName,
      'members': [],
      //'messages': ,
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': ''
    });

    await groupDocRef.update({
      'members': FieldValue.arrayUnion([uid + '_' + userName]),
      'groupId': groupDocRef.id
    });

    DocumentReference userDocRef = FirebaseFirestore.instance.collection("users").doc();
    return await userDocRef.update({
      'groups': FieldValue.arrayUnion([groupDocRef.id + '_' + groupName])
    });
  }


  // toggling the user group join
  Future togglingGroupJoin(String groupId, String groupName, String userName) async {

    DocumentReference userDocRef = FirebaseFirestore.instance.collection("users").doc(uid);
    DocumentSnapshot userDocSnapshot = await userDocRef.get();

    DocumentReference groupDocRef = groupCollection.doc(groupId);

    List<dynamic> groups = await userDocSnapshot.get('groups');

    if(groups.contains(groupId + '_' + groupName)) {
      //print('hey');
      await userDocRef.update({
        'groups': FieldValue.arrayRemove([groupId + '_' + groupName])
      });

      await groupDocRef.update({
        'members': FieldValue.arrayRemove([uid + '_' + userName])
      });
    }
    else {
      //print('nay');
      await userDocRef.update({
        'groups': FieldValue.arrayUnion([groupId + '_' + groupName])
      });

      await groupDocRef.update({
        'members': FieldValue.arrayUnion([uid + '_' + userName])
      });
    }
  }


  // has user joined the group
  Future<bool> isUserJoined(String groupId, String groupName, String userName) async {

    DocumentReference userDocRef = FirebaseFirestore.instance.collection("users").doc(uid);
    DocumentSnapshot userDocSnapshot = await userDocRef.get();

    List<dynamic> groups = await userDocSnapshot.get('groups');


    if(groups.contains(groupId + '_' + groupName)) {
      //print('he');
      return true;
    }
    else {
      //print('ne');
      return false;
    }
  }


  // get user data
  Future getUserData(String email) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").where('email', isEqualTo: email).get();
    print(snapshot.docs[0].data);
    return snapshot;
  }


  // get user groups
  getUserGroups(String myname) async {
    /*    getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatroom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }  */

    // return await Firestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
    return FirebaseFirestore.instance.collection("groups").where('users', arrayContains: myname).snapshots();
  }


  // send message
  sendMessage(String groupId, chatMessageData) {
    FirebaseFirestore.instance.collection('groups').doc(groupId).collection('messages').add(chatMessageData);
    FirebaseFirestore.instance.collection('groups').doc(groupId).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString(),
    });
  }


  // get chats of a particular group
  getChats(String groupId) async {
    return FirebaseFirestore.instance.collection('groups').doc(groupId).collection('messages').orderBy('time').snapshots();
  }


  // search groups
  searchByName(String groupName) {
    return FirebaseFirestore.instance.collection("groups").where('groupName', isEqualTo: groupName).get();
  }


}




  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // create group
  /*Future createGroup(String username, String groupName) async {
    DocumentReference groupDocRef = await FirebaseFirestore.instance.collection("users").doc().collection("groups").add({
      'groupName': groupName,
      'groupIcon': '',
      'admin': username,
      'members': [],
      //'messages': ,
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': ''
    });

    await groupDocRef.update({
      'members': FieldValue.arrayUnion([uid + '_' + username]),
      'groupId': groupDocRef.id
    });

    DocumentReference userDocRef = FirebaseFirestore.instance.collection("users").doc(uid);
    return await userDocRef.update({
      'groups': FieldValue.arrayUnion([groupDocRef.id + '_' + groupName])
    });
  }

  getUserGroups(String myname) async {
    // return await Firestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
    return await FirebaseFirestore.instance
        .collection("users")
        .where('groups', arrayContains: myname)
        .snapshots();
  }
  /*  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatroom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }*/

  searchByName(String groupName) {
    return FirebaseFirestore.instance.collection("groups").where('groupName', isEqualTo: groupName).get();
  }

  Future<bool> isUserJoined(String groupId, String groupName, String userName) async {

    DocumentReference userDocRef = FirebaseFirestore.instance.collection("users").doc(uid);
    DocumentSnapshot userDocSnapshot = await userDocRef.get();

    List<dynamic> groups = await userDocSnapshot.get('groups');


    if(groups.contains(groupId + '_' + groupName)) {
      //print('he');
      return true;
    }
    else {
      //print('ne');
      return false;
    }
  }

  // toggling the user group join
  Future togglingGroupJoin(String groupId, String groupName, String userName) async {

    DocumentReference userDocRef = FirebaseFirestore.instance.collection("users").doc(uid);
    DocumentSnapshot userDocSnapshot = await userDocRef.get();

    DocumentReference groupDocRef = FirebaseFirestore.instance.collection("users").doc(groupId);

    List<dynamic> groups = await userDocSnapshot.get('groups');

    if(groups.contains(groupId + '_' + groupName)) {
      //print('hey');
      await userDocRef.update({
        'groups': FieldValue.arrayRemove([groupId + '_' + groupName])
      });

      await groupDocRef.update({
        'members': FieldValue.arrayRemove([uid + '_' + userName])
      });
    }
    else {
      //print('nay');
      await userDocRef.update({
        'groups': FieldValue.arrayUnion([groupId + '_' + groupName])
      });

      await groupDocRef.update({
        'members': FieldValue.arrayUnion([uid + '_' + userName])
      });
    }
  }
  getChats(String groupId) async {
    return FirebaseFirestore.instance.collection('groups').doc(groupId).collection('messages').orderBy('time').snapshots();
  }
  sendMessage(String groupId, chatMessageData) {
    FirebaseFirestore.instance.collection('groups').doc(groupId).collection('messages').add(chatMessageData);
    FirebaseFirestore.instance.collection('groups').doc(groupId).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString(),
    });
  }*/





