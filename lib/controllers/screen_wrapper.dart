import 'package:creaplace/views/auth_screen.dart';
import 'package:creaplace/views/home_screen.dart';

import 'AppUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if(user != null) {
      return HomeScreen();
    } else {
      return AuthScreen();
    }
    
  }
}