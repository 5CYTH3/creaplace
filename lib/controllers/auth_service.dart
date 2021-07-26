import 'AppUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  Key? key;
  AuthService({this.key});

  FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _appUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_appUser);
  }
  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential resultUserCred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = resultUserCred.user;
      return _appUser(user);
    } catch (e) {
      print(e.toString);
    }
  }

  Future registerEmailPassword(String email, String password) async {
    try {
      UserCredential resultUserCred = _auth.createUserWithEmailAndPassword(email: email, password: password) as UserCredential;
      User? user = resultUserCred.user;
      return _appUser(user);
    } catch (e) {
      print(e.toString);
    }

  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  
  }

}