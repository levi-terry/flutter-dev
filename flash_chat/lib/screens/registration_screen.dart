import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  void _showDialog(var e) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text(e),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: "chat_logo",
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  RoundedInput(
                    inputText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    inputFunction: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  RoundedInput(
                    inputText: "Enter your password",
                    obscureText: true,
                    inputFunction: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    buttonFunction: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        if (password.length < 6) {
                          throw ("Password needs to be at least 6 characters");
                        }
                        UserCredential newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        _showDialog(e);
                      }
                    },
                    buttonText: "Register",
                    buttonColor: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
