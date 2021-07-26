import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar createAppBar() {
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
          onPressed: () {},
        )
      )
    ],
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.black, size: 30), 
      onPressed: () {},
    ),
    elevation: 1,
  );
}