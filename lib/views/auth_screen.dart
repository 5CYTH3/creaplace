import 'package:creaplace/controllers/auth_service.dart';
import 'package:creaplace/controllers/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
  final TextEditingController nameController = TextEditingController();

  final AuthService _auth = AuthService();

  void toggleAuthMode() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
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
            key: _formKey,
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
                showSignIn ? Container() :
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    icon: Icon(Icons.account_box)
                    
                  ),
                ),
                TextFormField(
                  validator: EmailValidator(errorText: "Not a valid email."),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    icon: Icon(Icons.mail_outline_rounded)
                    
                  ),
                ),
                TextFormField(
                  validator: MinLengthValidator(6, errorText: "Password must be 6+ char long."),
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.lock_open_rounded)
                  ),
                ),
                SizedBox(height: 40.0,),
                MaterialButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      var email = emailController.value.text;
                      var password = passwordController.value.text;
                                          
                      if(showSignIn == true) {
                        await _auth.signInEmailPassword(email, password);

                      } else {
                        try {
                          await _auth.registerEmailPassword(email, password);
                          await DatabaseService().saveUser(nameController.value.text);
                        } on FirebaseAuthException catch(e) {
                          print("YES, RIGHT ERROR");

                          if(e.code == 'email-already-in-use') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already in use !")));
                            print("YES, RIGHT ERROR");
                          }
                        } catch (e) {
                          print(e);
                        }
                      }    
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