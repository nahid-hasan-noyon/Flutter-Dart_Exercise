import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration-screen';

  const RegistrationScreen({super.key});
  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;
  ButtonState stateOfButton = ButtonState.idle;
  String errorMessage = '';

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 100.0,
              ),
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                obscuringCharacter: '*',
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  if (!value.contains('@')) {
                    setState(() {
                      showSnackBar(context, 'Invalid email');
                    });
                  } else {
                    password = value;
                  }
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ProgressButton.icon(
                iconedButtons: {
                  ButtonState.idle: const IconedButton(
                    text: "Register",
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  ButtonState.loading: IconedButton(
                    color: Colors.deepPurple.shade700,
                  ),
                  ButtonState.fail: IconedButton(
                    text: "Failed",
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    color: Colors.red.shade300,
                  ),
                  ButtonState.success: IconedButton(
                    text: "Registered",
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    color: Colors.green.shade400,
                  ),
                },
                onPressed: () async {
                  setState(() {
                    stateOfButton = ButtonState.loading;
                  });
                  try {
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    setState(() {
                      stateOfButton = ButtonState.success;
                    });
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.of(context)
                          .pushReplacementNamed(ChatScreen.routeName);
                    });
                  } catch (e) {
                    setState(() {
                      stateOfButton = ButtonState.fail;
                    });
                    if (e is FirebaseAuthException) {
                      if (e.code == 'email-already-in-use') {
                        errorMessage =
                            'The account already exists for that email.';
                      } else if (e.code == 'weak-password') {
                        errorMessage = 'The password provided is too weak.';
                      } else if (e.code == 'invalid-email') {
                        errorMessage = 'Invalid email format.';
                      }
                      showSnackBar(context, errorMessage);
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          stateOfButton = ButtonState.idle;
                        });
                      });
                    }
                  }
                },
                state: stateOfButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
