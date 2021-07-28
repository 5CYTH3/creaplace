import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creaplace/controllers/AppUser.dart';

class DatabaseService {

  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("user");

  Future<void> saveUser(String name) async {
    userCollection.add({
      'name': name,
      'uid': uid
    });

    return;
  }
    
  /* doc(uid).set({
      'name': name,
    });
  */
}