import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: AuthScreenBody(),
    );
  }
}

class AuthScreenBody extends StatefulWidget {
  const AuthScreenBody({ Key? key }) : super(key: key);

  @override
  _AuthScreenBodyState createState() => _AuthScreenBodyState();
}

class _AuthScreenBodyState extends State<AuthScreenBody> {
  
  bool showSignIn = false;

  void toggleAuthMode() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    showSignIn ? "Connectez vous" : "Inscrivez vous", 
                    style: GoogleFonts.roboto(
                      color: Colors.black, 
                      fontSize: 30
                    )
                  ),
                ),
                Text(
                  showSignIn ? "Pour accéder au monde fabuleux de la création !" : "Pour recevoir toutes les informations de Creative Place" ,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.black54
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    icon: Icon(Icons.mail_outline_rounded)
                    
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.lock_open_rounded)
                  ),
                ),
                SizedBox(height: 40.0,),
                MaterialButton(
                  onPressed: () {

                    if(showSignIn == true) {

                    } else {

                    }
                    
                  },
                  child: showSignIn ? Text("SIGNIN") : Text("SIGN UP"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Colors.black)),
                  height: 48,
                  minWidth: 125,
                ),
                SizedBox(height: 30.0),
                TextButton(
                  onPressed: () => toggleAuthMode(),
                  child: Text(
                    showSignIn ? "Pas de compte? Inscrivez vous !" : "Déjà un compte? Connectez vous !", 
                    style: GoogleFonts.roboto(
                      color: Colors.black, 
                      fontSize: 12
                    )
                  ),
                )
              ],
            ),
          ),
        )
      ),
      
    );
  }
}