import 'package:creaplace/controllers/auth_service.dart';
import 'package:creaplace/views/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 70,
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
                )
              ],
            ), 
          )
        ],
      ),
    );
  }
}