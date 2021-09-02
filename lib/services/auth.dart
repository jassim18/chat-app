import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluty/module/user.dart';
class AuthMethods {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  userr _userFromFirebaseUser(User user) {
    return user !=null  ? userr(userId : user.uid) : null;
  }

  Future signinwithEmailandPassword(String email,String password) async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User firebaseUser = userCredential.user;
    return _userFromFirebaseUser(firebaseUser);

    } catch (e) {
      print(e.toString());
    }
  }
  Future signupwithEmailandPassword(String email,String password)async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = userCredential.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }
    Future resetPass(String email) async{
      try{
        return await _auth.sendPasswordResetEmail(email: email);
      }catch(e){
        print.toString();
      }
    }
    Future signOut() async{
      try{
        return await _auth.signOut();
      }catch(e){
        print.toString();
      }
    }
  }








