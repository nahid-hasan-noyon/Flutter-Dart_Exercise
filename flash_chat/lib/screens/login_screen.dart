import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  ButtonState stateOfButton = ButtonState.idle;

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
                  //Do something with the user input.
                },
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
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                onTap: () {
                  setState(() {
                    stateOfButton = ButtonState.idle;
                  });
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
                    text: "Log In",
                    icon: Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  ButtonState.loading: IconedButton(
                      text: "Loading", color: Colors.deepPurple.shade700),
                  ButtonState.fail: IconedButton(
                      text: "Failed",
                      icon: const Icon(Icons.cancel, color: Colors.white),
                      color: Colors.red.shade300),
                  ButtonState.success: IconedButton(
                    text: "Success",
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    color: Colors.green.shade400,
                  )
                },
                onPressed: () async {
                  setState(() {
                    stateOfButton = ButtonState.loading;
                  });
                  try {
                    await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
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
                    print(e);
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
}
