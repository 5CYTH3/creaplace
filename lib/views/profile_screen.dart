import 'dart:io';

import 'package:creaplace/controllers/auth_service.dart';
import 'package:creaplace/controllers/database_service.dart';
import 'package:creaplace/views/components/app_bar.dart';
import 'package:creaplace/views/components/list_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateAppBar(),
      body: ProfileScreenBody(),
    );
  }
}

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({ Key? key }) : super(key: key);

  @override
  _ProfileScreenBodyState createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
 
  final AuthService _auth = AuthService();
  final picker = ImagePicker();
  File? _image;

  Future getImage() async {
    try {
      var _pickedImage = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File(_pickedImage!.path);
      });
    } catch(e) {
      print(e);
    }
  }

  Future uploadImage() async {
    
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topRight,
            child: MaterialButton(
              child: Text("LOG OUT"),
              onPressed: () async {
                await _auth.signOut(); 
              }
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              
              children: [
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage();

                      },
                      child: _image == null ? CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 70,
                      ) :
                      CircleAvatar(
                        backgroundImage: FileImage(_image!),
                        radius: 70,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Username", style: GoogleFonts.roboto(fontSize: 25)),
                              IconButton(
                                icon: Icon(Icons.edit), 
                                onPressed: () {}
                              )
                            ],
                          ),
                          Text(_auth.getUserEmail(), style: GoogleFonts.roboto(color: Colors.black45))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 60.0),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListItem(
                        leading: Icons.adb,
                        title: "Android power !",
                        subtitle: "proud user of android :)",
                      ),
                      ListItem(
                        leading: Icons.favorite_border_outlined,
                        title: "Lazy Liker",
                        subtitle: "You liked 10+ posts",
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}