import 'package:creaplace/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreateAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Creative Place",
        style: GoogleFonts.roboto(color: Colors.black)
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: Icon(Icons.account_circle_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          )
        )
      ],
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black, size: 30), 
        onPressed: () {
          Scaffold.of(context).openDrawer();

        },
      ),
      elevation: 1,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}