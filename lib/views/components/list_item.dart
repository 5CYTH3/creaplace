import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItem extends StatelessWidget {

  IconData? leading;
  String? title;
  String? subtitle;

  ListItem({ Key? key, this.leading, this.title, this.subtitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius: BorderRadius.circular(7.0), 
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(2  , 5),
          ),
        ]
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(this.leading, color: Colors.black, size: 30.0),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.title.toString(), style: GoogleFonts.roboto(fontSize: 17.0)),
                  Text(this.subtitle.toString(), style: GoogleFonts.roboto(fontSize: 12.0, color: Colors.black45))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}