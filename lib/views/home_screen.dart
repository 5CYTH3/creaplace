import 'package:creaplace/controllers/auth_service.dart';
import 'package:creaplace/views/components/app_bar.dart';
import 'package:creaplace/views/components/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      drawer: createDrawer(),
      bottomNavigationBar: null,
      body: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({ Key? key }) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
          child: Text("LOG OUT"),
          onPressed: () async {
            await _auth.signOut(); 
          }
        ),
      ),
    );
  }
}