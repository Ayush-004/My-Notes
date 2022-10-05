import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  var onPressed;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Enter your Email Address',
          ),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: 'Enter your Password',
          ),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              final userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: email, password: password);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('Email already in use');
              } else if (e.code == 'invalid-email') {
                print('Invalid Email entered');
              } else {
                print(e.code);
              }
            }

            print(UserCredential);
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}
