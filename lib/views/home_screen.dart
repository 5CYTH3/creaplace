import 'package:creaplace/controllers/auth_service.dart';
import 'package:creaplace/views/components/app_bar.dart';
import 'package:creaplace/views/components/drawer.dart';
import 'package:creaplace/views/rooms_screen.dart';
import 'package:flutter/material.dart';

import 'main_stream_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreenBody(),			
    MainStreamScreenBody(),
    RoomsScreenBody()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateAppBar(),
      drawer: createDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.desktop_mac_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_circle_outlined), label: '')
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 1,
        iconSize: 30,

        onTap: _onItemTap,
        currentIndex: _selectedIndex,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
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