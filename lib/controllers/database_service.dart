import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creaplace/controllers/AppUser.dart';

class DatabaseService {

  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("user");

  Future<void> saveUser(String name, File imageFile) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'imageFile': imageFile
    });
  }

  AppUserData _userFromSnapshot(DocumentSnapshot snapshot) {
    return AppUserData(
      uid: uid,
      name: snapshot.data()["name"],
    );
  }
  
  
  Stream<AppUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
      
  }
    
}