import 'dart:io';

class AppUser {
  final String? uid;

  AppUser({this.uid});

}

class AppUserData {

  final String? uid;
  final String? name;
  final File? imageFile;

  AppUserData({this.uid, this.name, this.imageFile});
  

}