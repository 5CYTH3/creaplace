import 'package:creaplace/controllers/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// TODO: Change lang of the auth_screen from french to english.
// TODO: Add validators
// TODO: Implement image upload
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final AuthService _auth = AuthService();

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
                    showSignIn ? "Sign In" : "Sign Up", 
                    style: GoogleFonts.roboto(
                      color: Colors.black, 
                      fontSize: 30
                    )
                  ),
                ),
                Text(
                  showSignIn ? "To access the amazing world of creation !" : "To receive all the informations about Creative Place" ,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.black54
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    icon: Icon(Icons.mail_outline_rounded)
                    
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.lock_open_rounded)
                  ),
                ),
                SizedBox(height: 40.0,),
                MaterialButton(
                  onPressed: () async {

                    var email = emailController.value.text;
                    var password = passwordController.value.text;

                    dynamic result = showSignIn ? await _auth.signInEmailPassword(email, password) : await _auth.registerEmailPassword(email, password);

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
                    showSignIn ? "Not registered ? Sign Up !" : "Already have an account? Sign In !", 
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